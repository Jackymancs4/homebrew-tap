class Sketch < Formula
  desc 'Super small productivity tool to generate draft files on the go from the terminal.'
  homepage 'https://github.com/smallwat3r/sketch'
  url 'https://github.com/smallwat3r/sketch/archive/463fc774d940ac84b89fc40bfb22993b13479447.zip'
  version '0.99.0-1'
  sha256 '9183987c2358aec550e98f4e76f5f209840b93286760547efa7138095301a96d'

  head 'https://github.com/smallwat3r/sketch.git', branch: 'master'

  def install
    # Create extension-less executable

    # Install executable
    bin.install 'src/sketch'
  end

  test do
    # Useless test
    assert_equal True, True
  end
end
