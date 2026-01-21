<!-- Copilot / AI assistant guide for contributors working on St. Jude Cloud Docs -->
# St. Jude Cloud Docs — AI assistant instructions

Purpose: help code-writing agents be immediately productive in this Nuxt + @nuxt/content documentation site.

- Quick start commands:
  - `pnpm install` — install deps (pnpm@9.x required).
  - `pnpm dev` — run local Nuxt dev server.
  - `pnpm build` / `pnpm preview` — build and preview production output.

- Architecture (high level):
  - This is a Nuxt 3 site using `@nuxt/content` for markdown-driven pages and `@nuxt/ui-pro` for UI components.
  - Content lives in the `content/` tree; navigation is configured via `_dir.yml` files and individual `.md` files.
  - Route rendering: the dynamic page `app/pages/[...slug].vue` loads markdown via `queryContent(route.path).findOne()`; modify that file only if you change page resolution behaviour.
  - Search API: `server/api/search.json.get.ts` exposes server-side content queries using `serverQueryContent`.

- Key files to reference when editing behaviour or layout:
  - Project entry & scripts: [README.md](README.md), [package.json](package.json#L1-L50)
  - Nuxt config & routing rules: [nuxt.config.ts](nuxt.config.ts)
  - Page rendering: [app/pages/[...slug].vue](app/pages/[...slug].vue)
  - Layout/navigation: [app/layouts/docs.vue](app/layouts/docs.vue)
  - App-level config (TOC, edit links): [app/app.config.ts](app/app.config.ts)
  - Server-side content API: [server/api/search.json.get.ts](server/api/search.json.get.ts)

- Project-specific conventions and patterns:
  - Content-first: add, reorder, and annotate pages via files in `content/`. Use `_dir.yml` to control navigation structure.
  - One sentence per Markdown line is enforced in style guidance — keep that when updating docs.
  - `toc.bottom.edit` in `app/app.config.ts` is used to render an "Edit this page" link; the front-end reads `_file` from content entries.
  - Use conventional commits (project uses `semantic-release`); prefer `git cz` / Commitizen for commits to trigger correct semantic releases.
  - Husky hooks are enabled; CI expects linting/typechecks in pipelines defined in repo tooling.

- Integration points & notable plugins:
  - `nuxt-3-intercom` (Intercom integration), `nuxt-og-image` (OG images), `@nuxt/image` and custom `sjc-icons` collection.
  - `pnpm` overrides shim `sharp` version in `package.json` — be mindful on native build failures on Apple Silicon.

- When changing UI or content rendering:
  - Prefer changes in `app/components` and `app/layouts` unless you must alter Nuxt internals.
  - To alter how markdown is converted, update `nuxt.config.ts` → `content` or `hooks` rather than editing generated output.

- Files to check when debugging build/runtime issues:
  - `package.json` scripts, `nuxt.config.ts`, `app/pages/[...slug].vue`, `server/api/*`, and `deployment/*` for environment-specific templates.

- Small examples:
  - To find the search endpoint implementation, see `server/api/search.json.get.ts` (uses `serverQueryContent`).
  - To change the left navigation tree source, edit `app/layouts/docs.vue` which calls `useContentHelpers()` and maps `_dir.yml` navigation.

If anything here is unclear or you want more detail on a specific area (CI, deployment templates, or content conventions), say which section to expand.
