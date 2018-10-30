#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

# Getting custom utility functions for showing sucess, error message or creating symlink.
. scripts/functions.sh

info "Prompting for sudo password..."

# Logging in as Admin
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

# Check if XCode is there, and installed.
info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Finished installing XCode command line tools."
else
    error "Failed to install XCode command line tools."
fi

# Package control must be executed first in order for the rest to work
# It will search for Brewfile, and through brew bundle command will install
# all packages listed in it, using cask and tap.
./packages/setup.sh

# After that it will look for setup.sh file, in all folder except packages
# and run them.
find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

success "Finished installing Dotfiles"