#!/usr/bin/env python3
"""
Recall - Summarize what you've learned from your Obsidian notes using AI
"""

## requirements.txt
# langgraph>=0.2.0
# langchain-core>=0.3.0
# langchain-openai>=0.2.0
# langchain-google-vertexai>=2.0.0
# google-auth>=2.0.0
# google-cloud-aiplatform>=1.38.0
# rich>=13.0.0
# typing-extensions>=4.0.0

import argparse
import json
import os
import subprocess
import sys
from datetime import datetime, timedelta
from typing import Optional

from rich.console import Console
from rich.markdown import Markdown

# LangGraph and LangChain imports
from langgraph.graph import StateGraph, END
from typing_extensions import TypedDict
from langchain_core.messages import HumanMessage, SystemMessage
from langchain_openai import ChatOpenAI
from langchain_google_vertexai import ChatVertexAI

console = Console()

# Default git repository and notes subdirectory
DEFAULT_GIT_REPO = os.path.expanduser("~/learn")
DEFAULT_NOTES_SUBDIR = "obsidian/obsidian"


class RecallState(TypedDict):
    """State for the recall workflow"""
    git_diff: str
    cleaned_diff: str
    summary: str
    error: Optional[str]
    vertex_location: Optional[str]


SYSTEM_PROMPT = """\
You are reviewing changes made to personal learning notes (markdown files).
Your job is to present what was learned, preserving the original detail and code samples.

Rules:
- Group the output by topic/category using markdown headings (##).
- Under each heading write a short (1-2 sentence) explanation of the context, then
  include the actual code snippets or commands that were added, inside fenced code blocks.
- Do NOT over-summarize. The notes are already concise. Prefer showing the real content
  (especially code samples, commands, configuration snippets) over paraphrasing them
  into tiny bullet points.
- If there are non-code learnings (concepts, insights), keep them as short paragraphs,
  not long bullet lists.
- Ignore minor formatting changes, typo corrections, and file renames.
- Keep the overall output concise but faithful to the original material.
"""


def log(msg: str) -> None:
    """Print a dim status message."""
    console.print(f"[dim]  {msg}[/dim]")


def log_ok(msg: str) -> None:
    """Print a green success message."""
    console.print(f"[green]  ✓ {msg}[/green]")


def log_err(msg: str) -> None:
    """Print a red error message."""
    console.print(f"[red]  ✗ {msg}[/red]")


def step(msg: str) -> None:
    """Print a bold step header."""
    console.print(f"\n[bold green]→ {msg}[/bold green]")


def validate_gemini_credentials(credentials_path: str) -> dict:
    """
    Validate service account credentials by checking the key ID
    still exists on Google's side. Returns the parsed JSON on success.
    Raises RuntimeError with a clear message on failure.
    """
    if not os.path.exists(credentials_path):
        raise RuntimeError(f"Credentials file not found: {credentials_path}")

    with open(credentials_path, "r") as f:
        info = json.load(f)

    for field in ("project_id", "private_key", "private_key_id", "client_email"):
        if field not in info:
            raise RuntimeError(f"Credentials file missing required field: {field}")

    log(f"Service account: {info['client_email']}")
    log(f"Project: {info['project_id']}")
    log(f"Key ID: {info['private_key_id']}")

    # Verify key still exists on Google side
    try:
        import urllib.request
        cert_url = info.get("client_x509_cert_url")
        if cert_url:
            log("Validating key against Google endpoint...")
            resp = urllib.request.urlopen(cert_url, timeout=10)
            certs = json.loads(resp.read())
            if info["private_key_id"] not in certs:
                available = ", ".join(k[:12] + "..." for k in certs.keys())
                raise RuntimeError(
                    f"Key ID '{info['private_key_id'][:12]}...' no longer exists on Google Cloud.\n"
                    f"  Available key IDs: {available}\n"
                    f"  The service account key was likely rotated or deleted.\n"
                    f"  Generate a new key:\n"
                    f"    gcloud iam service-accounts keys create /tmp/gemini-vertex-ai-credentials.json \\\n"
                    f"      --iam-account={info['client_email']}"
                )
            log_ok("Key ID is valid on Google Cloud")
    except urllib.error.URLError:
        log("Could not verify key online (network error), proceeding anyway...")

    return info


def get_git_diff(repo_path: str, notes_subdir: str, days: int) -> str:
    """
    Get git diff for the last X days with context.
    Filters out fully removed files.
    """
    since_date = (datetime.now() - timedelta(days=days)).strftime("%Y-%m-%d")
    log(f"Looking for changes since: {since_date}")

    try:
        # Find the commit from X days ago
        log("Finding git commit from target date...")
        result = subprocess.run(
            ["git", "rev-list", "-1", f"--before={since_date}", "HEAD"],
            cwd=repo_path, capture_output=True, text=True, check=True,
        )
        old_commit = result.stdout.strip()

        if not old_commit:
            log("No commit found at that date, using first commit...")
            result = subprocess.run(
                ["git", "rev-list", "--max-parents=0", "HEAD"],
                cwd=repo_path, capture_output=True, text=True, check=True,
            )
            old_commit = result.stdout.strip()

        log(f"Comparing: {old_commit[:8]}..HEAD")

        # Get diff scoped to the notes subdirectory
        log("Generating git diff for markdown files...")
        result = subprocess.run(
            ["git", "diff", "-U10", old_commit, "HEAD", "--", f"{notes_subdir}/*.md"],
            cwd=repo_path, capture_output=True, text=True, check=True,
        )

        diff_output = result.stdout
        log(f"Raw diff size: {len(diff_output)} characters")

        # Filter out fully deleted files
        filtered_diff = []
        current_file_lines: list[str] = []
        is_deleted_file = False
        deleted_count = 0

        for line in diff_output.split("\n"):
            if line.startswith("diff --git"):
                if current_file_lines and not is_deleted_file:
                    filtered_diff.extend(current_file_lines)
                elif is_deleted_file:
                    deleted_count += 1
                current_file_lines = [line]
                is_deleted_file = False
            elif line.startswith("deleted file mode"):
                is_deleted_file = True
                current_file_lines.append(line)
            else:
                current_file_lines.append(line)

        if current_file_lines and not is_deleted_file:
            filtered_diff.extend(current_file_lines)
        elif is_deleted_file:
            deleted_count += 1

        if deleted_count > 0:
            log(f"Filtered out {deleted_count} deleted file(s)")

        result_diff = "\n".join(filtered_diff)
        log(f"Filtered diff size: {len(result_diff)} characters")
        return result_diff

    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"Git command failed: {e.stderr}")


def clean_diff(state: RecallState) -> RecallState:
    """Extract meaningful added content from the git diff."""
    step("Cleaning and extracting changes")
    diff = state["git_diff"]

    if not diff:
        log("No changes found in the specified time period.")
        state["cleaned_diff"] = "No changes found in the specified time period."
        return state

    lines = diff.split("\n")
    added_content = []
    current_file = ""
    file_count = 0

    for line in lines:
        if line.startswith("diff --git"):
            parts = line.split()
            if len(parts) >= 4:
                current_file = parts[3].replace("b/", "")
                file_count += 1
        elif line.startswith("+") and not line.startswith("+++"):
            content = line[1:].strip()
            if content:
                added_content.append(f"[{current_file}] {content}")

    log(f"Processed {file_count} file(s) with changes")
    log(f"Extracted {len(added_content)} added line(s)")

    if not added_content:
        state["cleaned_diff"] = "No meaningful changes found (only deletions or formatting)."
        log("No meaningful additions found.")
    else:
        state["cleaned_diff"] = "\n".join(added_content)
        log_ok(f"Extracted content from {file_count} file(s)")

    return state


def summarize_with_ai(state: RecallState) -> RecallState:
    """Use AI to summarize the learned content."""
    step("Generating AI summary")
    cleaned_diff = state["cleaned_diff"]

    if "No changes found" in cleaned_diff or "No meaningful changes" in cleaned_diff:
        state["summary"] = cleaned_diff
        return state

    try:
        llm = _create_llm(state)

        user_prompt = (
            "Here are the changes made to my learning notes in the specified period:\n\n"
            f"{cleaned_diff}\n\n"
            "Please summarize what I've learned in a clear, concise, and well-organized way."
        )

        messages = [
            SystemMessage(content=SYSTEM_PROMPT),
            HumanMessage(content=user_prompt),
        ]

        log("Sending request to AI...")
        response = llm.invoke(messages)
        state["summary"] = response.content
        log_ok(f"Received summary ({len(response.content)} characters)")

    except Exception as e:
        log_err(f"AI error: {e}")
        state["error"] = f"Error during AI summarization: {e}"
        state["summary"] = "Failed to generate summary due to AI error."

    return state


def _create_llm(state: RecallState):
    """
    Create the appropriate LLM client based on environment configuration.

    Priority:
      1. GEMINI_CONFIG  -> Vertex AI with service account
      2. fallback       -> OpenAI-compatible gmktek
    """
    gemini_config = os.getenv("GEMINI_CONFIG")

    if gemini_config:
        log("Using Google Gemini (Vertex AI)")

        # Credentials were already validated at startup and loaded into env
        with open(gemini_config, "r") as f:
            info = json.load(f)

        project_id = info["project_id"]
        location = state.get("vertex_location", "us-central1")

        log(f"Project: {project_id}, Location: {location}")

        return ChatVertexAI(
            model_name="gemini-2.0-flash",
            project=project_id,
            location=location,
            temperature=0.3,
            max_tokens=8192,
        )

    # Default: OpenAI-compatible gmktek
    log("Using OpenAI (gmktek:11434)")
    return ChatOpenAI(
        base_url="http://gmktek:11434/v1",
        api_key="EMPTY",
        model="qwen3:30b",
        temperature=0.3,
        #        max_tokens=8192,
    )


def create_recall_graph():
    """Create the LangGraph workflow."""
    workflow = StateGraph(RecallState)
    workflow.add_node("clean", clean_diff)
    workflow.add_node("summarize", summarize_with_ai)
    workflow.set_entry_point("clean")
    workflow.add_edge("clean", "summarize")
    workflow.add_edge("summarize", END)
    return workflow.compile()


def main():
    parser = argparse.ArgumentParser(
        description="Summarize what you've learned from your Obsidian notes using AI",
    )
    parser.add_argument(
        "-d", "--days", type=int, default=7,
        help="Number of days to look back (default: 7)",
    )
    parser.add_argument(
        "-r", "--repo", type=str, default=DEFAULT_GIT_REPO,
        help=f"Path to git repository root (default: {DEFAULT_GIT_REPO})",
    )
    parser.add_argument(
        "-s", "--subdir", type=str, default=DEFAULT_NOTES_SUBDIR,
        help=f"Subdirectory to track within repo (default: {DEFAULT_NOTES_SUBDIR})",
    )
    parser.add_argument(
        "-l", "--location", type=str, default="us-central1",
        help="Vertex AI location/region (default: us-central1)",
    )

    args = parser.parse_args()
    repo_path = os.path.expanduser(args.repo)
    notes_subdir = args.subdir

    # --- Validate paths ---
    if not os.path.exists(repo_path):
        print(f"Error: Repository path does not exist: {repo_path}", file=sys.stderr)
        sys.exit(1)
    if not os.path.exists(os.path.join(repo_path, ".git")):
        print(f"Error: Path is not a git repository: {repo_path}", file=sys.stderr)
        sys.exit(1)
    full_notes_path = os.path.join(repo_path, notes_subdir)
    if not os.path.exists(full_notes_path):
        print(f"Error: Subdirectory does not exist: {full_notes_path}", file=sys.stderr)
        sys.exit(1)

    # --- Banner ---
    console.print("\n[bold cyan]═══════════════════════════════════════════[/bold cyan]")
    console.print("[bold cyan]  Recall - Learning Summary Generator[/bold cyan]")
    console.print("[bold cyan]═══════════════════════════════════════════[/bold cyan]\n")

    # Determine AI backend
    gemini_config = os.getenv("GEMINI_CONFIG")
    ai_backend = "OpenAI (gmktek)"
    if gemini_config:
        ai_backend = "Gemini (Vertex AI)"

    console.print("[bold]Configuration:[/bold]")
    console.print(f"  📁 Git repository:     [cyan]{repo_path}[/cyan]")
    console.print(f"  📂 Notes subdirectory: [cyan]{notes_subdir}[/cyan]")
    console.print(f"  📍 Full path:          [cyan]{full_notes_path}[/cyan]")
    console.print(f"  📅 Time window:        [cyan]{args.days} days[/cyan]")
    console.print(f"  🤖 AI backend:         [cyan]{ai_backend}[/cyan]")

    # --- Validate Gemini credentials up front ---
    if gemini_config:
        step("Validating Gemini credentials")
        try:
            validate_gemini_credentials(gemini_config)
            os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = gemini_config
            log_ok("Credentials validated")
        except RuntimeError as e:
            log_err(str(e))
            sys.exit(1)

    try:
        # --- Git diff ---
        step("Fetching changes from git repository")
        git_diff = get_git_diff(repo_path, notes_subdir, args.days)

        # --- LangGraph workflow ---
        initial_state = RecallState(
            git_diff=git_diff,
            cleaned_diff="",
            summary="",
            error=None,
            vertex_location=args.location,
        )

        graph = create_recall_graph()
        final_state = graph.invoke(initial_state)

        # --- Result ---
        if final_state.get("error"):
            log_err(final_state["error"])
            sys.exit(1)

        console.print("\n[bold green]✓ Summary generated successfully![/bold green]\n")
        console.print("[bold green]═══════════════════════════════════════════[/bold green]")
        console.print("[bold yellow]📚 Summary of Your Learnings[/bold yellow]")
        console.print("[bold green]═══════════════════════════════════════════[/bold green]\n")

        console.print(Markdown(final_state["summary"]))

    except KeyboardInterrupt:
        console.print("\n[bold red]Interrupted by user[/bold red]")
        sys.exit(1)
    except Exception as e:
        console.print(f"\n[bold red]Error:[/bold red] {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
