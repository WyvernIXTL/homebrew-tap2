class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "f34292725e0bc7a4b7a06d0de81264097a4a2b918a5d620315258606b67499e3"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/wuerfel-0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cff897965d7c80394db56305374fd36779a93dda82d8b4908a3de15bb0274682"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ecaa332349954cc91725fb5210d293d5b4deb5ecf428b955a0e2e74cba2c50bb"
  end

  depends_on "rust" => :build
  depends_on "expat"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"wuerfel", "--help"
    system bin/"wuerfel"
    system bin/"wuerfel", "-e", "128"
    system bin/"wuerfel", "-c", "4"
  end
end
