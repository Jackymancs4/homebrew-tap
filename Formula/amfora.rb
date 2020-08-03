# frozen_string_literal: true

class Amfora < Formula
  desc 'A fancy terminal browser for the Gemini protocol.'
  homepage 'https://github.com/makeworld-the-better-one/amfora'
  url 'https://github.com/makeworld-the-better-one/amfora/archive/v1.4.0.tar.gz'
  sha256 '140a613659f1df03a314093363e5fdf87e3529ea46f5f2533211b2a8f11b54a0'
  license 'GPL-3.0'
  version '1.4.0'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', 'bin/amfora'
    bin.install 'bin/amfora'
  end

  test do
    assert_equal shell_output("#{bin}/amfora -v").chomp, "amfora v#{version}"
  end
end
