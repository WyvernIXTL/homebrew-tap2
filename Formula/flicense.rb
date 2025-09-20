class Flicense < Formula
  desc "CLI for printing license information of rust cargo projects to the terminal"
  homepage "https://github.com/WyvernIXTL/flicense-rs"
  url "https://github.com/WyvernIXTL/flicense-rs/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8f0eef10c5327567d1bd6da52d98e990a39328d2428d06778387610cad18b4a2"
  license "BSL-1.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/flicense-0.3.0"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5255530cbd18a87f217aee0cdbc50ea6e99c57a43874d833fe0f953ccad40ddf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c9b2b505c24246b063a2cdeeae9c8601cecadaa579564a459b65d61f09f80f4"
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
