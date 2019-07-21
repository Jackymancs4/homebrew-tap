class GitLogger < Formula
    desc "a punch-card for git"
    homepage "https://gitlab.com/CrazyBaboon/git-logger"
    url "https://gitlab.com/CrazyBaboon/git-logger/-/archive/master/git-logger-master.tar.gz"
    version "0.99.0-1"
    sha256 "8b900e78599230305e943488330d949a5a1c76b55f478225fe8bef04654723e8"

    patch do
      url "https://raw.githubusercontent.com/Jackymancs4/homebrew-tap/feature/git-logger-formula/patches/git-logger.patch"
      sha256 "9a3b75fd6fe7942fd48d36226c24d10576e9589d9cf1a5382f6569f0a2369f7a"
    end

    def install

      # Create extension-less executable
      FileUtils.cp("#{buildpath}/git-logger.sh", "#{buildpath}/git-logger")

      # Install executable
      bin.install "#{buildpath}/git-logger"

    end

    test do
      # Useless test
      assert_equal True, True
    end
  end