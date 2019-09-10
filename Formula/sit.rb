class Sit < Formula
    desc "Serverless (offline-first, merge-friendly) Information Tracker"
    homepage "https://sit.fyi/"
    url "https://github.com/sit-fyi/sit/archive/v0.4.1.tar.gz"
    sha256 "ff78edeaf6e1831d0063e000209aed5d9d76461c455b3e7b4f3fb1dda9117cff"
    # version '0.4.1'

    depends_on "rust" => :build
    depends_on "cmake" => :build


    def install
        system "cargo", "build", "--release"

        bin.install "#{buildpath}/target/release/sit"
        bin.install "#{buildpath}/target/release/sit-web"

    end

    test do
      # Useless test
      assert_equal True, True
    end
end
