# frozen_string_literal: true

class Bonsai < Formula
  desc ".sh is a beautifully random  tree generator"
  homepage "https://gitlab.com/jallbrit/bonsai.sh"
  url "https://gitlab.com/jallbrit/bonsai.sh/-/archive/8f3a85e72532d30aa9b957c4c5af39a504405500/bonsai.sh-8f3a85e72532d30aa9b957c4c5af39a504405500.tar.gz"
  version "8f3a85e7"
  sha256 "7b6bad85aca9b3943d800a20a55a42db0813544885449d5033e094625c2b787b"

  head do
    url "https://gitlab.com/jallbrit/bonsai.sh"
  end

  if OS.mac?
    depends_on "coreutils"

    patch do
      url "https://raw.githubusercontent.com/Jackymancs4/homebrew-tap/921bab5793895f49661207a20f9692e02e57ce51/patches/bonsai.patch"
      sha256 "40ff2a24937f95cf64458d7b7cb957662ac46d0436dc5ea815d9d7cb824ee31d"
    end
  end

  def install
    # Create extension-less executable
    FileUtils.cp("#{buildpath}/bonsai.sh", "#{buildpath}/bonsai")

    # Install executable
    bin.install "#{buildpath}/bonsai"
  end

  test do
    assert shell_output("#{bin}/bonsai -h").chomp.start_with?("Usage: bonsai [OPTIONS]\n")
  end
end
