#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

# Loading all utility functions.
. ../scripts/functions.sh

COMMENT=\#*

# Admin user, as we have checked in bootstrap.sh file.
sudo -v

info "Installing Brewfile packages..."
# This command will search for "Brewfile" file, and install packages listed in it.
brew bundle
success "Finished installing Brewfile packages."

# It will list, all files with .list extension.
find * -name "*.list" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Installing $1 packages..."
    while read package; do
        if [[ $package == $COMMENT ]];
        then continue
        fi
        substep_info "Installing $package..."
        $cmd $package
    done < "$fn"
    success "Finished installing $1 packages."
done