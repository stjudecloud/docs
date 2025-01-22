# syntax = docker/dockerfile:1.4

FROM node:lts-slim as base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /src

FROM base as build

ARG NUXT_UI_PRO_LICENSE
ARG NUXT_PUBLIC_SITE_URL

COPY --link package.json pnpm-lock.yaml ./
RUN pnpm install

COPY --link . .

ENV NUXT_UI_PRO_LICENSE=${NUXT_UI_PRO_LICENSE}
ENV NUXT_PUBLIC_SITE_URL=${NUXT_PUBLIC_SITE_URL}

RUN pnpm build

FROM base

COPY --from=build /src/.output /src/.output

ENV HOST=0.0.0.0
ENV PORT=3000
ENV NODE_ENV=production

EXPOSE 3000

CMD [ "node", ".output/server/index.mjs" ]
