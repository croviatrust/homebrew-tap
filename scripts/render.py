#!/usr/bin/env python3
"""Render Formula/causari.rb from the latest causari GitHub release.

Reads the release's SHA256SUMS.txt (never computes hashes from downloads it
did not verify), prefers the causari-<tag>-<target> archives that hold both
`causari` and `re`, and falls back to the older re-<tag>-<target> archives.
Standard library only.

    python3 scripts/render.py            # latest release
    python3 scripts/render.py v0.2.0     # a specific tag
"""
import json
import re
import sys
import urllib.request

REPO = "croviatrust/causari"
TARGETS = {
    "arm_mac": "aarch64-apple-darwin",
    "x86_mac": "x86_64-apple-darwin",
    "arm_linux": "aarch64-unknown-linux-gnu",
    "x86_linux": "x86_64-unknown-linux-gnu",
}


def get(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": "causari-homebrew-tap"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


def main() -> int:
    tag = sys.argv[1] if len(sys.argv) > 1 else json.loads(get(f"https://api.github.com/repos/{REPO}/releases/latest"))["tag_name"]
    version = tag.lstrip("v")
    base = f"https://github.com/{REPO}/releases/download/{tag}"
    sums = {}
    for line in get(f"{base}/SHA256SUMS.txt").decode().splitlines():
        parts = line.split()
        if len(parts) == 2:
            sums[parts[1].lstrip("*")] = parts[0]

    def pick(target: str):
        for name in (f"causari-{tag}-{target}.tar.gz", f"re-{tag}-{target}.tar.gz"):
            if name in sums:
                return name, sums[name], name.startswith("causari-")
        raise SystemExit(f"no archive for {target} in SHA256SUMS.txt of {tag}")

    picks = {k: pick(t) for k, t in TARGETS.items()}
    both = all(p[2] for p in picks.values())
    install = (
        '    bin.install "causari", "re"' if both
        else '    bin.install "re"\n    bin.install_symlink bin/"re" => "causari"'
    )

    def block(key: str) -> str:
        name, sha, _ = picks[key]
        return f'      url "{base}/{name}"\n      sha256 "{sha}"'

    rb = f'''# Rendered by scripts/render.py from the {tag} release of {REPO}.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
{block("arm_mac")}
    end
    on_intel do
{block("x86_mac")}
    end
  end

  on_linux do
    on_arm do
{block("arm_linux")}
    end
    on_intel do
{block("x86_linux")}
    end
  end

  def install
{install}
  end

  test do
    assert_match "{version}", shell_output("#{{bin}}/causari --version")
    assert_match "{version}", shell_output("#{{bin}}/re --version")
  end
end
'''
    with open("Formula/causari.rb", "w") as f:
        f.write(rb)
    print(f"Formula/causari.rb rendered for {tag} ({'causari+re' if both else 're + symlink'})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
