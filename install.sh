#!/bin/bash
#
# Installs the Julia language module into BBEdit's Application Support
# folder. Run again to update; pass --uninstall to remove it.

set -e
here=$(cd "$(dirname "$0")" && pwd)
modules="$HOME/Library/Application Support/BBEdit/Language Modules"
module="$modules/Julia.plist"

if [ "$1" = "--uninstall" ]; then
    rm -f "$module"
    echo "Removed. Restart BBEdit to unload the Julia language module."
    exit 0
fi

mkdir -p "$modules"
install -m 644 "$here/Language Modules/Julia.plist" "$module"
echo "Installed $module"

# The older JuliaEditorSupport module also claims .jl files, so BBEdit
# would pick one of the two arbitrarily.
for old in "$modules"/*.plist; do
    [ "$old" = "$module" ] && continue
    if grep -q '<string>\.jl</string>' "$old" 2>/dev/null; then
        echo "Note: $old also claims .jl files. Remove it so this module is used:"
        echo "    rm \"$old\""
    fi
done
echo "Restart BBEdit and open a .jl file."
