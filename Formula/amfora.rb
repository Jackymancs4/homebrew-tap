# frozen_string_literal: true

class Amfora < Formula
  desc 'A fancy terminal browser for the Gemini protocol.'
  homepage 'https://github.com/makeworld-the-better-one/amfora'
  url 'https://github.com/makeworld-the-better-one/amfora/archive/v1.5.0.tar.gz'
  sha256 'c8478b00155ad74712b957444b7afe025a74030907b77cca0903b6477f79843d'
  license 'GPL-3.0'
  version '1.5.0'

  head do
    url 'https://github.com/makeworld-the-better-one/amfora.git'
  end

  depends_on 'go' => :build

  def install
    def applications
      share / 'applications'
    end

    system 'go', 'build', '-o', 'bin/amfora'
    bin.install 'bin/amfora'
    applications.install 'amfora.desktop'
  end

  test do
    assert_equal shell_output("#{bin}/amfora -v").chomp, "amfora v#{version}"
  end
end
