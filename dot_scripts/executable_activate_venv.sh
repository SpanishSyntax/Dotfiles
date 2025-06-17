#!/bin/bash

activate_when() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "Deactivating current virtual environment..."
        deactivate 2>/dev/null || echo "No virtual environment to deactivate."
    fi

    if [ -d "$1/.venv" ]; then
        echo "Activating virtual environment in $1"
        source "$1/.venv/bin/activate"

        # Force Python path from venv
        export PATH="$1/.venv/bin:$PATH"

        # Remove asdf shims from PATH
        export PATH=$(echo "$PATH" | sed 's|/home/usurper/.asdf/shims:||g')
        
        # For zsh, make sure hash is refreshed
        hash -r

    fi
}

activate_when "$(pwd)"
