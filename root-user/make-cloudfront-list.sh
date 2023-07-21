#!/bin/sh

set -ex

curl -s https://d7uri8nf7uskq.cloudfront.net/tools/list-cloudfront-ips | jq -r '(.CLOUDFRONT_GLOBAL_IP_LIST[],.CLOUDFRONT_REGIONAL_EDGE_IP_LIST[]) | @text "set_real_ip_from \(.);"' > /usr/local/etc/nginx/_cloudfront-ips.conf
mv /usr/local/etc/nginx/_cloudfront-ips.conf /usr/local/etc/nginx/cloudfront-ips.conf

nginx -t

nginx -s reload
