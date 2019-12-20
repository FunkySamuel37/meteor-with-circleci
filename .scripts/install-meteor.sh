curl -v https://install.meteor.com?release=$METEOR_VERSION -o /tmp/install_meteor.sh
# replace tar command with bsdtar in the install script (bsdtar -xf "$TARBALL_FILE" -C "$INSTALL_TMPDIR")
# https://github.com/jshimko/meteor-launchpad/issues/39
sh /tmp/install_meteor.sh
meteor --version
