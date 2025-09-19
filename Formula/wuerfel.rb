class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "f34292725e0bc7a4b7a06d0de81264097a4a2b918a5d620315258606b67499e3"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/wuerfel-0.1.11"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2ed33a7c1c3fd7375e873760b270c5c53bf0d6cb73ece3f7e8d282931cdce07c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "55318c18624b7a4ee756208472474648e88dab3209750f44ec48dc88e4aa13c4"
  end

  depends_on "expat" => :build
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
