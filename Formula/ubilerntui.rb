class Ubilerntui < Formula
  desc "Eine TUI um für die UBI-Prüfung zu lernen"
  homepage "https://github.com/WyvernIXTL/ubilerntui"
  url "https://github.com/WyvernIXTL/ubilerntui/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "7741c9f8304a60beed23d21dfce23f537785ddf33f55f087d50078cf17e8b266"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/ubilerntui-0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d424c5e4a7ade49a85a4941940b4600c48b1d947bbfa79c9249376a981696fa1"
    sha256 cellar: :any,                 arm64_linux:  "381d28f0eec969738b0eb6f5602dd3ee8062418f487531b69acdfe3f6c3a7669"
    sha256 cellar: :any,                 x86_64_linux: "5d9e171c5998d8f46eab3e676ad9580579ad9b21620c4b99f91432346553a416"
  end

  depends_on "expat" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ubilerntui", "--help"
  end
end
