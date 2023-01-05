class Termdvd < Formula
  include Language::Python::Virtualenv

  desc "Program that simulates the DVD video screensaver in the terminal"
  homepage "https://github.com/MrCatFace8885/termdvd"
  url "https://github.com/MrCatFace8885/termdvd/archive/bbb7927d1c3484b7d4702fa04101a4b9a6b88e45.tar.gz"
  version "bbb7927d1c3484b7d4702fa04101a4b9a6b88e45"
  sha256 "9f0dfb40e311c03c5677085f77a48a96f82a612941e6a26c725ac2fae41c64b7"
  license "MIT"

  depends_on "python"

  def install
    cp("#{buildpath}/termdvd.py", "#{buildpath}/termdvd")

    # Install executable
    bin.install "#{buildpath}/termdvd"
  end

  test do
    assert shell_output("#{bin}/termdvd --version").chomp.start_with?("termdvd, version")
  end
end
