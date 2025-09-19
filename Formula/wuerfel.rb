class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "f34292725e0bc7a4b7a06d0de81264097a4a2b918a5d620315258606b67499e3"
  license "MPL-2.0"

  depends_on "rust" => :build

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
