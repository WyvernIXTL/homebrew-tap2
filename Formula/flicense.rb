class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8f0eef10c5327567d1bd6da52d98e990a39328d2428d06778387610cad18b4a2"
  license "BSL-1.0"
  revision 1

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "621ebfaf6fccf38ce33058156b36d74ca590562c41236fb5fba8de295522f5d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0ce63260a241c4b50e7eb5b1551dfc5a17f4682959626a03573488dd1c0b7b81"
  end

  depends_on "expat" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(
      bin/"flicense",
      "--generate-shell-completion",
      shells: [:bash, :zsh, :fish, :pwsh],
    )
  end

  test do
    system bin/"flicense", "--help"
  end
end
