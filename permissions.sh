#!/bin/bash

# post-processing script for fixing permissions

################################################################################
### NZBGET POST-PROCESSING SCRIPT                                            ###

# Change file permission.

################################################################################
### OPTIONS                                                                  ###

# Put mode for files here. Should be -x (ex: 664 or 664 or 666)
mode=664

# Put mode for directories here. Should be +x (ex: 755 or 775 or 777)
dirmode=775

# Put user/group ownership here (in `user:group` format)
owner=

### NZBGET POST-PROCESSING SCRIPT                                            ###
################################################################################

set -e
function setperms {
    # recursively set perms files
    find "$NZBPP_DIRECTORY" -type f -exec chmod $NZBPO_MODE {} ';'

    # recursively set perms dirs
    find "$NZBPP_DIRECTORY" -type d -exec chmod $NZBPO_DIRMODE {} ';'

    # recursively set ownership
    [[ "$NZBPO_OWNER" != "" ]] && chown -R "$NZBPO_OWNER" "$NZBPP_DIRECTORY"
}

# Exit with status NONE if the download failed (and there's nothing to do)
[[ "${NZBPP_STATUS}" == "FAILURE"* ]] && exit 95

# Run the function and exit with success code if successful
setperms && exit 93
exit 94
