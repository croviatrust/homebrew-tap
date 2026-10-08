# Rendered by scripts/render.py from the v0.4.1 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.1/causari-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "31301a2c96ca1eef550b1f46a6e18c2916dcdb87d28ebf36435813758376b9b1"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.1/causari-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "39ac24c64bceb8245f55744072eea03b5c3c83ed5b27ffa1fe3223adabff7826"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.1/causari-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0321d8d398c356a060f32bdb71f8f698126d83b478a53a77eb0ac1ff1cfd760e"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.4.1/causari-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5451deb6458fcd14de48019d9d6ea95591cc0314fa084dfc1f42f99e7293618"
    end
  end

  def install
    bin.install "causari", "re"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/causari --version")
    assert_match "0.4.1", shell_output("#{bin}/re --version")
  end
end
