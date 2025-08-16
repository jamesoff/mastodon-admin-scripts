Moved to https://git.sr.ht/~jamesoff/mastodon-admin-scripts

# Mastodon Admin Scripts

This repo contains some scripts I threw together for running my Mastodon server. I figured they may be of use to others so I'm sharing them here.

My Mastodon server runs FreeBSD but these should be applicable to Linux hosts too.

## Scripts

### mastodon-user

These scripts are to be run as the `mastodon` user, or the user your mastodon processes run as.

* `backup.sh` - Creates a backup of the Postgres database; executed by the `root` backup script.
* `weekly-tidy.sh` - Executed weekly by cron to tidy up media files.

## root-user

These scripts are to be run as `root`.

* `backup.sh` - Executed daily by cron to take a backup. Calls the `backup.sh` script above to back the database up, then backs up necessary files using [tarsnap](https://www.tarsnap.com/), and then tidies up old tarsnap archives.
* `make-cloudfront-list.sh` - Executed daily by cron to update a [list of IPs](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/LocationsOfEdgeServers.html) used by [Amazon CloudFront](https://aws.amazon.com/cloudfront/), used by nginx to show [client IPs in logs](https://nginx.org/en/docs/http/ngx_http_realip_module.html) (instead of the CloudFront IP).

## daemontools

These scripts are to be used with [daemontools](https://cr.yp.to/daemontools.html) to run the mastodon services. I have them in `/var/service/mastodon-{sidekiq,streaming,web}` which makes it easy to restart all the mastodon services: `svc -t /var/service/mastodon-*`.

Note that the environment variables for each daemon are set via the `env` directory mechanism offered by daemontools. Likewise, logging is handled by a `log/run` script for each service using `multilog`. See the **Environment** link below for more information.

## Monitoring

The weekly tidy and backup scripts both touch a sentinel file, which is monitored by my [SimpleMonitor](https://simplemonitor.readthedocs.io/en/latest/) install to ensure the tasks completed successfully.

## Environment

See [https://jamesoff.net/2022/12/05/mastodon-on-freebsd.html](https://jamesoff.net/2022/12/05/mastodon-on-freebsd.html) for information on how Mastodon is installed on my server.

## Licence

MIT. See [LICENCE](LICENCE).
