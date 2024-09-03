#!/usr/bin/env bash
sleep 2
cliphist wipe
sleep 2
if [ -d ~/.cache/cliphist ]; then
    rm -rf ~/.cache/cliphist
fi
