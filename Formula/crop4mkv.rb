class Crop4mkv < Formula
  desc "Bun ts script that analyses crop margins of a video and sets the margins"
  homepage "https://github.com/WyvernIXTL/crop4mkv"
  url "https://github.com/WyvernIXTL/crop4mkv/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "5680c0ed65b2019732b5d9504ce4badb008daaabb47c466956aa691127e4983b"
  license "MPL-2.0"

  depends_on "pkgx" => :build
  depends_on "ffmpeg"
  depends_on "mkvtoolnix"

  def install
    system "pkgx", "bun", "install", "--production"
    system "pkgx", "bun", "build", "--compile", "--minify", "--sourcemap", "./src/index.ts", "--outfile", "crop4mkv"
    bin.install "crop4mkv"
  end

  test do
    system bin/"crop4mkv", "--help"
    system bin/"crop4mkv", "-g", "."
  end
end
