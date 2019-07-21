class GitLogger < Formula
    desc "a punch-card for git"
    homepage "https://gitlab.com/CrazyBaboon/git-logger"
    url "https://gitlab.com/CrazyBaboon/git-logger/-/archive/master/git-logger-master.tar.gz"
    version "0.99.0-1"
    sha256 "8b900e78599230305e943488330d949a5a1c76b55f478225fe8bef04654723e8"

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
