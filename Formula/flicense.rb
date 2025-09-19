class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f03db1feaae5671bcdcdaa43000616e30792c73f9826def79c2e2bdac0f9e750"
  license "BSL-1.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.3.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2578d5b4ca3ffb392ff5c66ecf2242cccf61f842e9c0c5e8db55c57a860462b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0164d0c34d13203498064b3cea9a81eec262d2a42a51002a5758c0d2e112c979"
  end

  depends_on "rust" => :build
  depends_on "expat" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"flicense", "--help"
  end
end
