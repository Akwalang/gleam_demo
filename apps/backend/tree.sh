#!/bin/bash

listdir() {
    local dir="${1:-.}"
    local prefix="${2:-}"
    local indent="${3:-}"
    
    for item in "$dir"/*; do
        [ -e "$item" ] || continue
        name=$(basename "$item")
        
        if [ -d "$item" ]; then
            echo "${indent}${prefix}📁 $name/"
            listdir "$item" "" "$indent    "
        else
            echo "${indent}${prefix}📄 $name"
        fi
    done
}

listdir > tree.txt
