class GitLogger < Formula
  desc "Punch-card for git"
  homepage "https://gitlab.com/CrazyBaboon/git-logger"
  url "https://gitlab.com/CrazyBaboon/git-logger/-/archive/400371a6a4d406fdcdfa6996a801092afe275e7f/git-logger-400371a6a4d406fdcdfa6996a801092afe275e7f.tar.gz"
  version "0.99.0-2"
  sha256 "1a0db52752b10020722459299ba7f3169efd2d7db709902004b790032d5510d1"

  patch do
    url "https://raw.githubusercontent.com/Jackymancs4/homebrew-tap/12a0eeea9aa4927e05f5658d07c6b13d8bcec607/patches/git-logger.patch"
    sha256 "9a3b75fd6fe7942fd48d36226c24d10576e9589d9cf1a5382f6569f0a2369f7a"
  end

  def install
    # Create extension-less executable
    cp("#{buildpath}/git-logger.sh", "#{buildpath}/git-logger")

    # Install executable
    bin.install "#{buildpath}/git-logger"
  end

  test do
    # Useless test
    assert_equal True, True
  end
end
