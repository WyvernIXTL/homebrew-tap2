class Ubilerntui < Formula
  desc "Eine TUI um für die UBI-Prüfung zu lernen"
  homepage "https://github.com/WyvernIXTL/ubilerntui"
  url "https://github.com/WyvernIXTL/ubilerntui/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "cb019ffc6763934ce06828cfe8fc2076ca9abebba4212cc54554773ce630187c"
  license "GPL-3.0-or-later"
  revision 1

  depends_on "expat" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ubilerntui", "--help"
  end
end
