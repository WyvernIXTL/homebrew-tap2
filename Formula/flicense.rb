class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "3d4f376d03921e17e01802e7bad84027331d3c9e69fabfc19bde632ec1f1e3a7"
  license "BSL-1.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "37269f947f233920b7eed3523bef75fb7f097524beed1808eaa964095a6d446e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cae8ad236cd4a833c0d67630be705ba9cae33c4f29a2055560f4a050e0b21ef7"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "83b233500e06423f77b1ae727df9fc8fad8f08bde6dc778784b11f79716a8093"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "36fac4e2f408ba3adf6ecf36eccc35ce7e836bed290e3c1e9f30986eace8cfec"
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
