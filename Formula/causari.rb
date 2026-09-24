# Rendered by scripts/render.py from the v0.3.0 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.3.0/causari-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "76249909ad6ea3720248f0892d857460593aa5ef22f33410f72d7a856cbe01ed"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.3.0/causari-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "474e808f83b648f8e00039fcffa7425b4056c560ad94f1f9fc1024a33255416b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.3.0/causari-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "877a46b1081d93b846537c6506a236c7fb1628ecda5d321994ebdebc301001b5"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.3.0/causari-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84243a7d08894e0b425eaaf2e6f7d1c04847478fb9f18070721666d183a2ffe8"
    end
  end

  def install
    bin.install "causari", "re"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/causari --version")
    assert_match "0.3.0", shell_output("#{bin}/re --version")
  end
end
