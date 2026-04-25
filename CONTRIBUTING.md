# Contributing to migratowl-action

## Issues and feature requests

Open an issue in this repo for bugs or improvements specific to the GitHub Action wrapper.

For issues with the Migratowl scanner itself (analysis quality, server errors, API changes), open an issue in [bitkaio/migratowl](https://github.com/bitkaio/migratowl).

## Pull requests

1. Fork the repo and create a branch from `main`.
2. Make your changes.
3. Open a pull request — the e2e workflow runs automatically on every PR.

## Local testing

The action can be tested locally by invoking the scripts directly:

```bash
# Set required env vars, then run individual scripts
export SCAN_TRIGGER=always
export RESULTS_DESTINATION=artifact
export MIGRATOWL_VERSION=latest
bash scripts/extract-deps.sh
```

For a full end-to-end test, use [act](https://github.com/nektos/act):

```bash
act pull_request -W .github/workflows/e2e.yml \
  --secret ANTHROPIC_API_KEY=<your-key>
```

## License

By contributing, you agree your contributions are licensed under the [Apache 2.0 License](LICENSE).
