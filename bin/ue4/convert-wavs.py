#!/usr/bin/env python3

import os
import subprocess
import logging

LOG = logging.getLogger(__name__)


for path, dirs, files in os.walk("."):
    for f in files:
        if not f.endswith(".wav"):
            continue

        LOG.info(f"Processing {path}/{f}")
        subprocess.check_call(["sox", f"{path}/{f}", "-b16", f"{path}/__x{f}"])
        os.rename(f"{path}/__x{f}", f"{path}/{f}")

