<template>
    <div class="ge-code-editor-container">
        <div ref="editorContainer"
             class="ge-code-editor"
             :style="style"></div>
    </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';

import * as monaco from 'monaco-editor';
import { editor } from 'monaco-editor/esm/vs/editor/editor.api';

@Component
export default class MonacoCodeEditor extends Vue {
    private editor: editor.IStandaloneCodeEditor | null = null;
    private wasMounted = false;

    public mounted() {
        this.editor = monaco.editor.create(this.$refs.editorContainer as any, {
            language: 'python',
            automaticLayout: true,
            lineNumbersMinChars: 2,
            glyphMargin: true,
        });

        this.setValue('@step(r"^logged in as user \'(.+?)\'"):\ndef logged_in_as_user' +
                      '(context, user) -> User:\n\t"""\n\tcomment\n\t"""\n\tpass');

        // const decorations = this.editor.deltaDecorations([], [
        //     {
        //         range: new monaco.Range(3, 1, 3, 1),
        //         options: {
        //             isWholeLine: true,
        //             className: 'ge-code-breakpoint-code',
        //             glyphMarginClassName: 'ge-code-breakpoint-decorator',
        //         },
        //     },
        // ]);

        this.wasMounted = true;
    }

    public get style(): {[name: string]: string} {
        return {
            width: '100%',
            height: 'calc(100vh - 190px)',
        };
    }

    public setValue(text: string): void {
        if (!this.editor) {
            return;
        }

        this.editor.setValue(text);
    }
}
</script>

<style lang="scss">
.ge-code-editor-container {
    position: relative;
}

.ge-code-editor {
    position: absolute;
    bottom: 0;
    top: 0;
    left: 0;
    bottom: 0;
}

.ge-code-breakpoint-decorator {
    background: #cc3333;
    border-radius: 50%;

    &:before {
      content: "";
      color: white;
      font-family: "Font Awesome 5 Free";
      font-size: 0.7em;
      text-shadow: -1px -1px 2px #770000;
      position: relative;
      top: -1px;
      left: 5px;
    }
}
.ge-code-breakpoint-code {
	background: lightblue;
}
</style>
