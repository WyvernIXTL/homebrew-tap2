class Wuerfel < Formula
  desc "Diceware password generator cli based on eff password lists"
  homepage "https://github.com/WyvernIXTL/wuerfel-rs"
  url "https://github.com/WyvernIXTL/wuerfel-rs/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "27b1c4da5f2e2e8c8ec9f86db1420faa9d2e7fb0e271ab8865c3e80640f1c2bd"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/wuerfel-0.1.13"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "38b637ede79795832add04a8ef35a04e3d7b85fa74317dca19a55b5a97d53764"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "69b8d19d7479b9cbdea09b4340e854d738df176db3993295dddcbc3ec118f5b0"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "2584d0ba4503c8a1992cb4fbcad896c745f20a38c606003e3cf7d6e6e6b72fd7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2eb187df07b3e101b9229482527cecc152b477cb353287efe02b5b663f540a18"
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
