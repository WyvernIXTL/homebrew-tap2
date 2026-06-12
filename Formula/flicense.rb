class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "b89c4ebb1fd959f8c64370c8f69cf6a3446b2a6a319a2ca1c40c71a64377011b"
  license "BSL-1.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.6.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ad93ecdcfac9d43a862ee7a94e1872cd7e02d33f33c9f2963932eabde6b07831"
    sha256 cellar: :any,                 arm64_linux:  "444a3ca01542dca9b1afa207de9ef6f770c7dfa1fa12bee58bf6ebee9129f4eb"
    sha256 cellar: :any,                 x86_64_linux: "7a3dd0aec36d27ba9159f4fd59174e2ccebf20183dc375e0487a7d493585b059"
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
