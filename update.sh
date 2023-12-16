#!/bin/bash
if [[ `git rev-parse --abbrev-ref HEAD` != main ]]; then git checkout main; fi
git pull