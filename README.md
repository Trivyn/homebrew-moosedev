# homebrew-moosedev

A [Homebrew](https://brew.sh) tap for [MOOSEDev](https://github.com/Trivyn/moosedev) —
a neurosymbolic MCP memory server for coding agents.

## Install

```sh
brew install Trivyn/moosedev/moosedev
```

(equivalently `brew tap Trivyn/moosedev && brew install moosedev`)

This installs a pre-built binary — MOOSEDev's MOOSE engine is closed-source, so the
formula downloads the self-contained release tarball rather than compiling. Supported
platforms: macOS (Apple Silicon) and Linux (x86-64).

## Maintenance

`Formula/moosedev.rb` is **auto-generated** on each MOOSEDev release by the `homebrew`
job in [`Trivyn/moosedev`'s release workflow](https://github.com/Trivyn/moosedev/blob/main/.github/workflows/release.yml),
which renders it from
[`packaging/homebrew/render-formula.sh`](https://github.com/Trivyn/moosedev/blob/main/packaging/homebrew/render-formula.sh)
with the release version and checksums. Edit that script, not this file.
