class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "3d4f376d03921e17e01802e7bad84027331d3c9e69fabfc19bde632ec1f1e3a7"
  license "BSL-1.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "bbd857048d4c67b0e0ba2c57ab49ce3b83a748ddaebb724f5708e4434cb81301"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6988c05abf0c52734073f101c8dbb0d7dfeb0a59f2d3da2bc63e2e40bb952b3b"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5aacbcd5be3869df6ff7f9e9ed758a535e7a60c3a7eb960f1723367bc4386450"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c5d95abf2db79fce63d02e78bfe33ddcece872b747f27c18296584481b14fd23"
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
