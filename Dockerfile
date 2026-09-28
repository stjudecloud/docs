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
FROM nginxinc/nginx-unprivileged:1-alpine

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

EXPOSE 3000
