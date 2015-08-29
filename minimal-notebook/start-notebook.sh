#!/bin/bash
set -e

# Create non-root NB_USER, member of group "users"
useradd -m -s /bin/bash -u ${NB_UID:-1000} -G users $NB_USER

# Allow "users" group to update conda root env
chown -R root.users $CONDA_DIR
chmod -R g+w $CONDA_DIR

# Setup a work directory rooted in the NB_USER home
mkdir -p $WORK
chown root.users $WORK
chmod g+w $WORK

# Enable sudo if requested
if [ ! -z "$GRANT_SUDO" ]; then
    echo "$NB_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/notebook
fi

# Start supervisord in foreground, PID1
exec supervisord -n -c /etc/supervisor/supervisord.conf