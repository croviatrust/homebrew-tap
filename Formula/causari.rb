# Rendered by scripts/render.py from the v0.4.0 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.0/causari-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "8330dbaf41e3e340fdd26225727d73526a9d602463152de59e20fc5c16897024"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.0/causari-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a5b9f593025b280af5ff01bd80839942456926c18cab857ca8fd9729061b83e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.0/causari-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3021b2423d79eadfa03c0fff799e3f06846015a1fb6c19f2b20487fb5320fb40"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.0/causari-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cc041dd51f276edef15e0283de22d5362e07c6e7af6456ecf2258ce2d152041"
    end
  end

  def install
    bin.install "causari", "re"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/causari --version")
    assert_match "0.4.0", shell_output("#{bin}/re --version")
  end
end
