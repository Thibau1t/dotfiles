#!/usr/bin/env bash
cliphist wipe
sleep 1
if [ -d ~/.cache/cliphist ]; then
    rm -rf ~/.cache/cliphist
fi
