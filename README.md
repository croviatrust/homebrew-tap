# croviatrust/homebrew-tap

Homebrew tap for [Causari](https://causari.dev): AI-written code has no
author. It has causes. Causari proves them.

```sh
brew install croviatrust/tap/causari
causari --version   # `re` is installed alongside as the short alias
re audit            # AI code survival of the repo you are in; a count, not a grade
```

`Formula/causari.rb` is rendered by `scripts/render.py` from the latest
[release](https://github.com/croviatrust/causari/releases) and its
`SHA256SUMS.txt`; the workflow re-renders it every six hours and on demand.
Do not edit the formula by hand.

Every release archive carries a signed SLSA provenance attestation from
the release workflow; check one with
`gh attestation verify <archive> --repo croviatrust/causari`.
