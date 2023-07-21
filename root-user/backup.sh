#!/bin/sh

set -ex

/usr/local/bin/setuidgid mastodon '/home/mastodon/bin/backup.sh'

/usr/local/bin/tarsnap -c \
        -f "mastodon-$(date +%Y%m%d)" \
        --humanize-numbers \
        /home/mastodon/backup \
        /var/db/redis/dump.rdb \
        /home/mastodon/live/.env.production

/usr/local/bin/python3.10 /root/src/things/tidysnap/tidysnap.py

touch /home/mastodon/backup-timestamp
