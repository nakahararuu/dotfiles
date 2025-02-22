# ASDF configuration code

# https://github.com/asdf-vm/asdf/issues/1895
# source (brew --prefix asdf)/share/fish/vendor_completions.d/asdf.fish

set -gx ASDF_CONFIG_FILE "$HOME/.config/asdf/asdfrc"
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/default-npm-packages"


if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
if not contains $_asdf_shims $PATH
    # Do not use fish_add_path (added in Fish 3.2) because it
    # potentially changes the order of items in PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

