# Rendered by scripts/render.py from the v0.5.0 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author. It has causes. Causari records them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.5.0/causari-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "b65b79cceae8301cab303223cdfad404120e1fc0e2c54e481b3b9a5bc7158ce9"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.5.0/causari-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "4faeec10f4989a7e4470b9ceea6d4538f81de6ed27c931ab4343f825377bd064"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.5.0/causari-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2370868e50e37392e6deb559afca54bcb4ed62848bc0b0bd6e1407a089f00f0"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.5.0/causari-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7663de816d564a62ecf0bfead03f2ba5350268c9e330359755b40e03810e6acf"
    end
  end

  def install
    bin.install "causari", "re"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/causari --version")
    assert_match "0.5.0", shell_output("#{bin}/re --version")
  end
end
