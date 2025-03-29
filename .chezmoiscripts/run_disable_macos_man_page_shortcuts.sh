#!/bin/sh
# https://gist.github.com/theodson/b4282a3b6e54091db4d52a4c3c10ad25

TEMP_SETTINGS_FILE=$(mktemp -t 'man-shortcuts-off.json')
cat > $TEMP_SETTINGS_FILE <<EOF
{
  "NSServicesStatus": {
    "com.apple.Terminal - Open man Page in Terminal - openManPage": {
      "presentation_modes": {
        "ContextMenu": false,
        "ServicesMenu": false
      },
      "enabled_context_menu": false,
      "enabled_services_menu": false
    },
    "com.apple.Terminal - Search man Page Index in Terminal - searchManPages": {
      "presentation_modes": {
        "ContextMenu": false,
        "ServicesMenu": false
      },
      "enabled_context_menu": false,
      "enabled_services_menu": false
    }
  }
}
EOF
# Settings are stored in the pbs domain. Other settings in this domain will not be overwritten. I’ve included the settings to change in JSON for brevity. They are converted to XML (which `defaults import` expects) before being imported.
plutil -convert xml1 -o - ${TEMP_SETTINGS_FILE} | defaults import pbs -
rm ${TEMP_SETTINGS_FILE}

