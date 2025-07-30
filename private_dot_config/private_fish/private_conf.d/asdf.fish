# file locations
set -gx ASDF_CONFIG_FILE "$HOME/.config/asdf/asdfrc"
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/default-npm-packages"

# misc
set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true

# ASDF configuration code ---------------------------
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# --------------------------------------------------

