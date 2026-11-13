class Aid < Formula
  desc "Identity CLI for the Ace ID service"
  homepage "https://github.com/tab-gl/aid-cli"
  version "2.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/tab-gl/aid-cli/releases/download/v2.0.0/aid-aarch64-apple-darwin.bin"
      sha256 "c65b5869961f82cd0d80984c2e95eb33dfed8efb3ed767480f4b6f8024fa43c2"
    end

    on_intel do
      url "https://github.com/tab-gl/aid-cli/releases/download/v2.0.0/aid-x86_64-apple-darwin.bin"
      sha256 "a38fee1e93d2d74ec31fd07a511de7d334e22aa2ddd36f774387f44255d925f7"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "aid-aarch64-apple-darwin.bin" => "aid"
    else
      bin.install "aid-x86_64-apple-darwin.bin" => "aid"
    end
  end

  test do
    assert_match "2.0.0", shell_output("#{bin}/aid --version")
  end
end
