# frozen_string_literal: true

class Dsc < Formula
  desc "Docpell command-line interface"
  homepage "https://github.com/docspell/dsc"
  url "https://github.com/docspell/dsc/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "d9fc1cb4c02c74bb741a238c2ec94f19cadee1ce62b6d29c9f12e548641dd7f0"
  license "GPL-3.0"
  revision 1

  head do
    url "https://github.com/docspell/dsc.git"
    depends_on "rust" => :build
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    system "strip", "target/release/dsc"

    bin.install "target/release/dsc"
  end

  test do
    assert_equal shell_output("#{bin}/dsc -v").chomp, "dsc #{version}"
  end
end
