class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "https://github.com/unfs3/unfs3"
  url "https://github.com/unfs3/unfs3.git", using: :git, revision: "9ed6a63"
  version "0.10.0-9ed6a63"
  head "https://github.com/unfs3/unfs3.git"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "bison"
  depends_on "flex"
  depends_on "gcc"
  depends_on "libtirpc"

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/unfsd", "--version"
  end
end
