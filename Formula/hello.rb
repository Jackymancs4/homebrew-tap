class Hello < Formula
  desc "Program providing model for GNU coding standards and practices"
  homepage "https://www.gnu.org/software/hello/"
  url "https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz"
  sha256 "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"

  bottle do
    root_url "https://homebrew.bintray.com/bottles"
    sha256 cellar: :any_skip_relocation, mojave:        "f9d6285eafa4317c5a653bd02832bdabe4df9f6b18702274d551b28cc45d8b23"
    sha256 cellar: :any_skip_relocation, high_sierra:   "1b66790d42664fe95d44f56d2c82db7ea2ce03e01bda0c8e9932f3b768342c7b"
    sha256 cellar: :any_skip_relocation, sierra:        "9691f91e7c6897d525b76f5910144e0ed0adcb8bd8f7bb155f29fd431d8ff431"
    sha256 cellar: :any_skip_relocation, el_capitan:    "54ac46b692fcca2abe77aeeca41976172a2dc24a6762f84a47fabcaba336df89"
    sha256 cellar: :any_skip_relocation, yosemite:      "f81a305402e8f8b6cf11a17dac81f604b6f48d940909886a6733cf4f6a64c05f"
    sha256 cellar: :any_skip_relocation, mavericks:     "c80495cb6d1ad8f2c3a64c22c9dcee9d0117ca25fa6426f20a6acca275cd6c56"
    sha256 cellar: :any_skip_relocation, mountain_lion: "c3468e676f2c9cb511e537774424299342ffd52740e252e515bddae6d9e79df3"
  end

  conflicts_with "camlistore", because: "both install `hello` binaries"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
  test do
    assert_equal "formula", shell_output("#{bin}/hello --greeting=formula").chomp
  end
end
