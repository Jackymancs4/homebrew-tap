class Put < Formula
  desc "Pretty text printer"
  homepage "https://github.com/Unlimiter/put"
  url "https://github.com/Unlimiter/put/archive/v2.0.14-a.0.tar.gz"
  version "2.0.14-a0-1"
  sha256 "075654786b48e03e07087d9c794733a3d37dc8cd00b598e8abf93339b1e7789c"

  depends_on "make" => :build

  def install
    # Generate binary
    system "make", "put", "CPPFLAGS=-std=c++11"

    # Move binary
    bin.install "put"

    # Add man page
    man.mkpath
    man1.install "put.1"
  end

  test do
    assert_equal "brew\e[0m", shell_output("#{bin}/put brew").chomp
  end
end
