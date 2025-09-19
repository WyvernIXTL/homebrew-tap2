class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f03db1feaae5671bcdcdaa43000616e30792c73f9826def79c2e2bdac0f9e750"
  license "BSL-1.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "cargo", "new", "test-proj"
    Dir.chdir("test-proj") do
      system "cargo", "add", "license-fetcher"
      system bin/"flicense"
      system bin/"flicense", "--short"
      system bin/"flicense", "-o"
      system bin/"flicense", "--stats"
    end
  end
end
