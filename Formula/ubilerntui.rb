class Ubilerntui < Formula
  desc "Eine TUI um für die UBI-Prüfung zu lernen"
  homepage "https://github.com/WyvernIXTL/ubilerntui"
  url "https://github.com/WyvernIXTL/ubilerntui/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "cb019ffc6763934ce06828cfe8fc2076ca9abebba4212cc54554773ce630187c"
  license "GPL-3.0-or-later"
  revision 1

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/ubilerntui-0.1.10_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "302595d0a360f8faff31879fcddef0e58a097751ebc1f417a38dae85793901d5"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "9ae83d44955b9a157d2c7b53266f8a279aa84f32453caeb6affc2b5f050422fa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e6186030bbef79d60f90c98f3f978112fa130701c6a324cb8b654b1c8e0da8b"
  end

  depends_on "expat" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ubilerntui", "--help"
  end
end
