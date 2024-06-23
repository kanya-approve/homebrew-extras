class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "https://github.com/unfs3/unfs3"
  url "https://github.com/unfs3/unfs3.git", using: :git, revision: "9ed6a63"
  version "0.10.0-9ed6a63"
  head "https://github.com/unfs3/unfs3.git"

  bottle do
    root_url "https://github.com/kanya-approve/homebrew-extras/releases/download/unfs3-0.10.0-9ed6a63"
    rebuild 1
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6223aa41929597ad967cd624e41d574824734e75c5b4053722f721b1a1a2aba"
  end

  depends_on "autoconf"
  depends_on "automake"
  depends_on "bison"
  depends_on "flex"
  depends_on "gcc"
  depends_on "glibc"
  depends_on "libtirpc"
  depends_on "pkg-config"

  def install
    ENV.deparallelize # Build is not parallel-safe

    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{sbin}/unfsd", "-h"
  end
end
