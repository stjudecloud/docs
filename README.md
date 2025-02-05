<p align="center">

  <h1 align="center">
    St. Jude Cloud Docs
  </h1>

  <p align="center">
   <a href="https://github.com/stjudecloud/docs" target="_blank">
     <img alt="Status"
          src="https://img.shields.io/badge/status-active-success.svg" />
   </a>
   <a href="https://github.com/stjudecloud/docs" target="_blank">
     <img alt="Github Issues"
          src="https://img.shields.io/github/issues/stjudecloud/docs"  />
   </a>
   <a href="https://github.com/stjude/stjudecloud/docs"  target="_blank">
     <img alt="GitHub pull requests"
          src="https://img.shields.io/github/issues-pr/stjudecloud/docs">
   </a>
   <a href="https://github.com/stjudecloud/docs/blob/master/LICENSE.md" target="_blank">
     <img alt="License: MIT"
          src="https://img.shields.io/badge/License-MIT-blue.svg" />
   </a>
  </p>


  <p align="center">
  Educational resources for the St. Jude Cloud project.
   <br />
   <a href="https://docs.stjude.cloud"><strong>Explore the docs »</strong></a>
   <br />
   <br />
   <a href="https://github.com/stjudecloud/docs/issues/new?assignees=&labels=&template=feature_request.md&title=Descriptive%20Title&labels=enhancement">Request Feature</a>
    | 
   <a href="https://github.com/stjudecloud/docs/issues/new?assignees=&labels=&template=bug_report.md&title=Descriptive%20Title&labels=bug">Report Bug</a>
   <br />
    ⭐ Consider starring the repo! ⭐
   <br />
  </p>
</p>

---
## Quick Start

You can use the following commands to get started working with St. Jude Cloud docs.

```bash [Terminal]
# install all of the dependencies
pnpm install

# run a development mode server
pnpm dev
```

### Development

Development of the St. Jude Cloud Docs codebase is relatively simple.
Follow these guidelines to keep you between the rails 👍:

1. Use [the commands in the quick start section](#quick-start) to set up the code base, install dependencies, and run a development server.
2. This project enforces [conventional commits] using the [`conventional-changelog`] verbs.
   A large chunk of automation is built off of this convention, so please follow it!
   - Reading the above material is suggested, but not required for development.
   - If, in practice, you use `git cz` (which calls [`commitizen`] underneath the hood) instead of `git commit`, then this will be taken care of.
     This is the suggested method for beginners. 
   - If you're updating content (e.g. the documentation) and not source code, be sure to use the appropriate verb (e.g. use `docs:` for documentation upgrades).
3. The following integrations have been enabled or are in development. As such, you don't need to do anything other than commit!
    - [x] Automated building with [Nuxt] and [Nuxt UI] 🧰.
    - [x] Automated versioning with [conventional commits], [`conventional-changelog`], and [semantic-release] 🗂.
    - [x] Automated production release and internal branch previews 🚀.
    - [x] Automated integration with [Intercom] for support questions in browser 💬.
    - [x] Automated spell checking 📚.
    - [x] Automated link validation 🔗.

### General Guidelines

- Prefer 1 sentence per line of markdown.
- Format code using back-ticks to avoid it being reported as a spelling error.

### Contact

With any issues you encounter with the repo, please file an issue report. For any other questions, please contact us at [support@stjude.cloud](mailto:support@stjude.cloud).

#### COPYRIGHT 

Copyright © 2025 St. Jude Children's Research Hospital.

[Nuxt]: https://nuxt.com/
[Nuxt UI]: https://ui.nuxt.com/
[commitizen]: https://www.npmjs.com/package/commitizen
[conventional commits]: https://www.conventionalcommits.org/en/v1.0.0/#summary
[`conventional-changelog`]: https://github.com/conventional-changelog/conventional-changelog
[Intercom]: https://www.intercom.com/
[semantic-release]: https://semantic-release.gitbook.io/semantic-release/
