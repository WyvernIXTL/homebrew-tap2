class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "72d72673312cdeffbf25b6c53180b0d6f2c034534ad970552b8cf73766b0d81d"
  license "MPL-2.0"
  revision 1

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/wuerfel-0.1.12"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eefb926dedfbeb4015ffd37abb6872f13f3989cffee14b603a0af6a8a857c4bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "37754a22a20eaaee3c565b879ee934225f8508c9481b789861a10a6988027759"
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
