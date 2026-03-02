#!/usr/bin/env bash

set -o errexit
set -o pipefail

# install python tools/libs for pre-commit

uv pip install -U pre-commit
# Spike pre-commit to use uv pip install rather than pip install
cp -v util.py .venv/lib/python3*/site-packages/pre_commit/util.py
uv pip install -U yamllint
uv pip install -U checkov
uv pip install -U cfn-lint jschema-to-python sarif-om junit-xml pydot
uv pip install -U ruff flake8 black
