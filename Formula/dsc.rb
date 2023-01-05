# frozen_string_literal: true

class Dsc < Formula
    desc "Fancy terminal browser for the Gemini protocol"
    homepage "https://github.com/docspell/dsc"
    url "https://github.com/docspell/dsc/archive/refs/tags/v0.9.0.tar.gz"
    version "0.9.0"
    sha256 "55a2d98e438ed3d41ad6bae6b4e04348a04e28a279fdc09866a1fdd5ee91d3ec"
    license "GPL-3.0"
    revision 1
  
    head do
      url "https://github.com/docspell/dsc.git"
      depends_on "rust" => :build
    end
  
    depends_on "rust" => :build
  
    def install
        system "cargo", "build", "--release"
        system "strip", "target/release/dsc"

        bin.install "target/release/dsc"
    end
  
    test do
      assert_equal shell_output("#{bin}/dsc -v").chomp, "dsc"
    end
  end
  