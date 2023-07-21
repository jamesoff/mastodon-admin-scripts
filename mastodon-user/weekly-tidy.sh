#!/bin/sh

set -ex

export PATH=/home/mastodon/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

RAILS_ENV=production /home/mastodon/live/bin/tootctl media remove
RAILS_ENV=production /home/mastodon/live/bin/tootctl preview_cards remove

/usr/bin/touch /home/mastodon/tidy-timestamp
