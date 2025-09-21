class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "72d72673312cdeffbf25b6c53180b0d6f2c034534ad970552b8cf73766b0d81d"
  license "MPL-2.0"
  revision 1

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/wuerfel-0.1.12_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "cd9ea070dd167acd9c95355e702946f7bcef45f6a0e69b7e585bd9f2ac0855d9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "07a1bdfe5083659e1673926b296fafc15905e704d6ab63e665043550fb3470d3"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "7b5708edf33fe0f8411198a46c4d4fb7cfd7a5e808d9da761a99f5c1facc8dc0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "550faba32f30311f493a995a6033ddfa76b8d5fb2f79609f2ea1a6b4711cf963"
  end

  depends_on "expat" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(
      bin/"wuerfel",
      "--generate-shell-completion",
      shells: [:bash, :zsh, :fish, :pwsh],
    )
  end

  test do
    system bin/"wuerfel", "--help"
    system bin/"wuerfel"
    system bin/"wuerfel", "-e", "128"
    system bin/"wuerfel", "-c", "4"
  end
end
