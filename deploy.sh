#!/usr/bin/env bash
# Publish the site to Cloudflare Pages (https://mohammad-hayat.pages.dev).
# Copies only the public files into dist/ so nothing else gets uploaded.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf dist && mkdir dist
cp -r index.html 404.html styles.css main.js robots.txt sitemap.xml assets dist/
npx -y wrangler@4 pages deploy dist --project-name mohammad-hayat --branch main --commit-dirty=true
