#!/bin/sh -euv


CLI='/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'
CURRENT_PROFILE=($CLI --show-current-profile-name)

if [[ $CURRENT_PROFILE = 'Default profile' ]]
then
	"$CLI" --select-profile 'half keyboard';
else
	"$CLI" --select-profile 'Default profile';
fi

