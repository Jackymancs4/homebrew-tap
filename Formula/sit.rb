# frozen_string_literal: true

class Sit < Formula
  desc 'Serverless (offline-first, merge-friendly) Information Tracker'
  homepage 'https://sit.fyi/'
  version '0.4.1'

  stable do
    url 'https://github.com/sit-fyi/sit/archive/v0.4.1.tar.gz'
    sha256 'ff78edeaf6e1831d0063e000209aed5d9d76461c455b3e7b4f3fb1dda9117cff'

    if OS.mac?

      resource 'sit' do
        url 'https://github.com/sit-fyi/sit/releases/download/v0.4.1/sit-x86_64-macosx'
        sha256 'c3a03144bb0d05dc127adbb140c19357d38def5f0c802b3e64a49d0817c94b2c'
      end

      resource 'sit-web' do
        url 'https://github.com/sit-fyi/sit/releases/download/v0.4.1/sit-web-x86_64-macosx'
        sha256 'b7fa6380a2090f8e3ad26a90e62562b2f72e2c2e101a81ef6d7650f6662cb6e0'
      end

    elsif OS.linux?

      resource 'sit' do
        url 'https://github.com/sit-fyi/sit/releases/download/v0.4.1/sit-x86_64-linux'
        sha256 '9bff6077a578a221fd0135bb415737299cc1ed542df25c29bfdce83971b13e5b'
      end

      resource 'sit-web' do
        url 'https://github.com/sit-fyi/sit/releases/download/v0.4.1/sit-web-x86_64-linux'
        sha256 'ce2be3949e2cd5d8ea64d1b2d12fffdc9b5c98a9b770ecc14bc4b3e876b80ef8'
      end

    end
  end

  devel do
    url 'https://github.com/sit-fyi/sit/archive/v0.4.1.tar.gz'
    sha256 'ff78edeaf6e1831d0063e000209aed5d9d76461c455b3e7b4f3fb1dda9117cff'

    depends_on 'rust' => :build
    depends_on 'cmake' => :build
  end

  head do
    url 'https://github.com/sit-fyi/sit'

    depends_on 'rust' => :build
    depends_on 'cmake' => :build
  end

  def install
    if build.devel? || build.head?

      system 'cargo', 'build', '--release'

      bin.install "#{buildpath}/target/release/sit"
      bin.install "#{buildpath}/target/release/sit-web"

    else

      resource('sit').stage do
        if OS.mac?
          system 'mv', 'sit-x86_64-macosx', 'sit'
        elsif OS.linux?
          system 'mv', 'sit-x86_64-linux', 'sit'
        end

        bin.install 'sit'
      end

      resource('sit-web').stage do
        if OS.mac?
          system 'mv', 'sit-web-x86_64-macosx', 'sit-web'
        elsif OS.linux?
          system 'mv', 'sit-web-x86_64-linux', 'sit-web'
        end

        bin.install 'sit-web'
      end

    end
  end

  test do
    assert_equal "SIT 0.4.1", shell_output("#{bin}/sit --version").chomp
  end
end
