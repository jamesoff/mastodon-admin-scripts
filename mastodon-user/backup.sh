#!/bin/sh

set -e

cd ~mastodon && mkdir -p backup && /usr/local/bin/pg_dump -Fc mastodon_production -f /home/mastodon/backup/postgres.dump
