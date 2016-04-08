#!/bin/sh

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

### NZBGET POST-PROCESSING SCRIPT                                            ###
################################################################################

# recursively set perms files
find "$NZBPP_DIRECTORY" -type f -exec chmod $NZBPO_MODE {} ';'

# recursively set perms dirs
find "$NZBPP_DIRECTORY" -type d -exec chmod $NZBPO_DIRMODE {} ';'

# 93 is code for success
exit 93