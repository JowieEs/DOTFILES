#!/bin/bash

export FZF_DEFAULT_OPTS="
    --layout=reverse
    --info=hidden
    --scrollbar=''
    --prompt='  '
    --pointer='▶'
"

exec sway-launcher-desktop
