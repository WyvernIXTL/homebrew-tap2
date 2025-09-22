class Crop4mkv < Formula
  desc "Bun ts script that analyses crop margins of a video and sets the margins"
  homepage "https://github.com/WyvernIXTL/crop4mkv"
  url "https://github.com/WyvernIXTL/crop4mkv/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "5680c0ed65b2019732b5d9504ce4badb008daaabb47c466956aa691127e4983b"
  license "MPL-2.0"

  bottle do
    root_url "https://github.com/WyvernIXTL/homebrew-tap2/releases/download/crop4mkv-0.7.3"
    sha256                               arm64_tahoe:   "bf85bf76c3626f66d3792424d1df56fa38e10b1dd9c6b039a5232ca28fac62cc"
    sha256                               arm64_sequoia: "a972094eaaee37d180debe8565c71a7d972922dfa0a99f2202951e7bb9c3acb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0822ffdf37fbd5e5d9befc56ed87ff0c1ad6105643ce3d005b737182728e2fe0"
  end

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
