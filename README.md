<p align="center">
  <a href="https://github.com/stjudecloud/docs"><img src="./docs/docs-banner-lighthouse.jpg" width="800" title="St. Jude Cloud Docs"></a>
  <p align="center">
    <a href="https://travis-ci.org/stjudecloud/docs" target="_blank">
      <img alt="Build Status: Master" src="https://github.com/stjudecloud/docs/workflows/Continuous%20Deployment/badge.svg" />
    </a>
    <a href="https://github.com/stjudecloud/docs/blob/master/LICENSE.md" target="_blank">
      <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
    </a>
  </p>
</p>

> Documentation for the St. Jude Cloud project.

### 🏠 [Homepage](https://stjude.cloud/docs)

## Install

First, note that we include the theme as a submodule. You must use the
`--recurse-submodules` command when you clone the repo to get everything needed
to build the docs.

```bash
git clone --recurse-submodules git@github.com:stjudecloud/docs.git
```

We use conda to achieve consistency amongst our environment setups. You must [install conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) before running the commands below.

```bash
conda env create
conda activate docs
```

If you wish to install the dependencies in your own Python environment without conda, you can certainly do so, but you're on your own :).

## Usage

You can use the following commands to get started working with the docs.

```bash
# Build the docs once
mkdocs build

# Run a development server
mkdocs serve
```

## Deployment

Commits to `master` automatically deploy after 5-10 minutes to https://stjude.cloud/docs. There is no other deploy process available (or needed) currently. If you are working on a large change, we highly recommend you start a branch and submit a pull request when you are finished.

## Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/stjudecloud/docs/issues). You can also take a look at the [contributing guide](https://github.com/stjudecloud/docs/blob/master/CONTRIBUTING.md).

## 📝 License

Copyright © 2020 [St. Jude Cloud Team](https://github.com/stjudecloud).<br />
This project is [MIT](https://github.com/stjudecloud/docs/blob/master/LICENSE.md) licensed.
