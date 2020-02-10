#!/usr/bin/env bash
set -o nounset

$HOME/.embulk/bin/embulk "${@}"
