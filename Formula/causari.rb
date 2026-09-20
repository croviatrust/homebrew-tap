# Rendered by scripts/render.py from the v0.2.0 release of croviatrust/causari.
# Do not edit by hand; run the workflow or the script.
class Causari < Formula
  desc "AI-written code has no author, it has causes: Causari proves them"
  homepage "https://causari.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.2.0/causari-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "feb169d357bc7f1a7693936af9cd21f911ffccac889b83127272fcd9b80b6699"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.2.0/causari-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "3b415d5d844bf4b28596f63eed1677bcccc2c8225202f7997dbb6b72222b69eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/croviatrust/causari/releases/download/v0.2.0/causari-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec9c2f23de8557e6d64ce9485624e42d1524d708e36b06afdd2070894f08c004"
    end
    on_intel do
      url "https://github.com/croviatrust/causari/releases/download/v0.2.0/causari-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e60b8745a55b48cb2af6aa5e6f710291c939f0b84e9ee4feb8be27e532980fc8"
    end
  end

  def install
    bin.install "causari", "re"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/causari --version")
    assert_match "0.2.0", shell_output("#{bin}/re --version")
  end
end
