class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8f0eef10c5327567d1bd6da52d98e990a39328d2428d06778387610cad18b4a2"
  license "BSL-1.0"
  revision 1

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.4.0_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "32dcc4f86beecee9e1f7d2a24982a10cc225259a345eb6afc6149daf170412a9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "35523211accb867a97fcea6cef2c561692ef410c93946b5abc3161f924cdff76"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "171eb8135f8d4b87be8c343d4cf82890acd1f30bbffe6735943d8cb49377765d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "620292cf2e81836e7dfb8d9c06cfc1a135baf521c7679c2842c881dbdff184c0"
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
