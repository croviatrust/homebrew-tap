# Rendered by scripts/render.py from the v0.1.5 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.1.5/re-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "03729973c73785a7a30647f2a0985a5b4b9bb5656615c7a7084e3b04174103e5"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.1.5/re-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "57d6ad0e8f26a3aaf192266aae8dabac0ff2d04a65e119c905dce9139d190680"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.1.5/re-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59333694917aed257b23eed631fbab59252a7355d738aeb3819df1f8a26aef41"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.1.5/re-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08b723450b9cd7e39983b4464cf173ce9959ae76da5a885b326de25573e3346f"
    end
  end

  def install
    bin.install "re"
    bin.install_symlink bin/"re" => "causari"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/causari --version")
    assert_match "0.1.5", shell_output("#{bin}/re --version")
  end
end
