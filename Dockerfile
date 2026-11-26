# syntax=docker/dockerfile:1

FROM node:26-slim AS build

WORKDIR /src

# Install the pnpm version pinned in package.json's `packageManager` field
# (e.g. `pnpm@9.12.2`) with npm, since Node 25+ no longer includes Corepack.
RUN --mount=type=bind,source=package.json,target=package.json \
    npm install --global "$(node -p 'require("./package.json").packageManager')"

COPY --link package.json pnpm-lock.yaml .npmrc ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --frozen-lockfile --store-dir /pnpm/store

COPY --link . .

# These are baked into the static site at build time; setting them when the
# container starts has no effect.
ARG NUXT_UI_PRO_LICENSE
ARG NUXT_PUBLIC_SITE_URL=https://docs.stjude.cloud
ENV NUXT_UI_PRO_LICENSE=${NUXT_UI_PRO_LICENSE} \
    NUXT_PUBLIC_SITE_URL=${NUXT_PUBLIC_SITE_URL}

RUN pnpm generate

# The site is fully static (`nuxt generate`), so serve it with nginx rather than Node.
FROM nginx:1.31.10-alpine

# The official image starts nginx as root. Run it unprivileged instead (as the
# now-archived nginxinc/nginx-unprivileged image did): no `user` directive, and
# the pid file and temp paths live in /tmp, which a non-root user can write.
COPY --link <<'EOF' /etc/nginx/nginx.conf
worker_processes auto;

error_log /var/log/nginx/error.log notice;
pid /tmp/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;

    client_body_temp_path /tmp/client_temp;
    proxy_temp_path /tmp/proxy_temp;
    fastcgi_temp_path /tmp/fastcgi_temp;
    uwsgi_temp_path /tmp/uwsgi_temp;
    scgi_temp_path /tmp/scgi_temp;

    sendfile on;
    keepalive_timeout 65;

    include /etc/nginx/conf.d/*.conf;
}
EOF

COPY --link <<'EOF' /etc/nginx/conf.d/default.conf
server {
    listen 3000;
    root /usr/share/nginx/html;
    absolute_redirect off;

    gzip on;
    gzip_types text/css application/javascript application/json image/svg+xml text/plain application/xml;

    # Keep in sync with the `redirect` entries in `routeRules` (nuxt.config.ts),
    # which are not prerendered and so do not exist in the static output.
    location = / { return 307 /overview; }
    location = /genomics-platform { return 307 /genomics-platform/getting-started/overview; }
    location = /pecan { return 307 /pecan/overview/getting-started; }
    location = /visualization-community { return 307 /visualization-community/overview/what-is-visualization-community; }
    location = /genomics-platform/about-our-data/st-jude-cloud-disease-ontology { return 307 /cc4k; }

    location / {
        # `/overview` and `/overview/` are both served from `/overview/index.html`.
        try_files $uri $uri/index.html $uri.html =404;
    }

    location /_nuxt/ {
        # Build assets have content hashes in their file names.
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    error_page 404 /404.html;
}
EOF

COPY --link --from=build /src/.output/public /usr/share/nginx/html

# The `nginx` user (UID 101) from the base image. It's numeric so Kubernetes
# `runAsNonRoot` can check it.
USER 101

EXPOSE 3000
