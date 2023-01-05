# frozen_string_literal: true

class Amfora < Formula
  desc "Fancy terminal browser for the Gemini protocol"
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.7.1.tar.gz"
  version "1.7.1"
  sha256 "55a2d98e438ed3d41ad6bae6b4e04348a04e28a279fdc09866a1fdd5ee91d3ec"
  license "GPL-3.0"
  revision 1

  head do
    url "https://github.com/makeworld-the-better-one/amfora.git"
    depends_on "cmake" => :build
  end

  depends_on "go" => :build

  def install
    if build.head?
      system "make"
      system "make", "install"
    else
      system "go", "build", "-o", "bin/amfora"
      bin.install "bin/amfora"

      applications = -> { share / "applications" }
      applications.install "amfora.desktop"
    end
  end

  test do
    assert_equal shell_output("#{bin}/amfora -v").chomp, "amfora v#{version}"
  end
end
