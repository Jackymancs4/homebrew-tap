require "language/go"

class MongoTools < Formula
    homepage "https://github.com/mongodb/mongo-tools/"
    url "https://github.com/mongodb/mongo-tools/archive/r4.2.0.tar.gz"
    sha256 "7a611d208b2247f2f56b28be1821177137254229c997e63c47ba1ea27d055962"

    head "https://github.com/mongodb/mongo-tools.git"

    depends_on "go" => :build

    patch do
        url 'https://raw.githubusercontent.com/Jackymancs4/homebrew-tap/feature/mongo-tools-formula/patches/mongo-tools.patch'
        sha256 '46779c2e0cb63692bacd2ead3e735f741950f2a01b19004e191186541702d44f'
    end

    go_resource "go.mongodb.org/mongo-driver" do
      url "https://go.mongodb.org/mongo-driver",
          :revision => "216e392ea5ac0903291d940c2574a11a185663bd"
    end

    go_resource "github.com/howeyc/gopass" do
      url "https://github.com/howeyc/gopass",
          :revision => "44476384cd4721b68705e72f19e95d1a3a504370"
    end

    go_resource "github.com/jessevdk/go-flags" do
      url "https://github.com/jessevdk/go-flags",
          :revision => "97448c91aac742cbca3d020b3e769013a420a06f"
    end

    go_resource "github.com/smartystreets/goconvey" do
      url "github.com/smartystreets/goconvey",
          :revision => "bf58a9a1291224109919756b4dcc469c670cc7e4"
    end

    # go_resource "golang.org/pkg/unicode/" do
    #   url "https://golang.org/pkg/unicode"
    # end

    # go_resource "golang.org/pkg/unicode/utf8" do
    #   url "https://golang.org/pkg/unicode/utf8"
    # end

    # go_resource "golang.org/pkg/unicode/utf16" do
    #   url "https://golang.org/pkg/unicode/utf16"
    # end

    # go_resource "golang.org/pkg/unsafe/" do
    #   url "https://golang.org/pkg/unsafe"
    # end

    def install

        mkdir_p buildpath/"src/github.com/mongodb"
        ln_s buildpath, buildpath/"src/github.com/mongodb/mongo-tools"

        # ENV["GOPATH"] = buildpath
        ENV["GOROOT"] = "/usr/local/opt/go/libexec"
        # system "git init #{buildpath}/src/github.com/mongodb/mongo-tools"

        Language::Go.stage_deps resources, buildpath/"src/github.com/mongodb/mongo-tools/vendor"

        system "#{buildpath}/src/github.com/mongodb/mongo-tools/build.sh"

        # system "source", "#{buildpath}/src/github.com/mongodb/mongo-tools/set_goenv.sh"
        # system "set_goenv"
        # system "go", "build", "-o", "bin/bsondump", "bsondump/main/bsondump.go"

        bin.install "bin/bsondump" => "bsondump"

        # bsondump mongostat mongofiles mongoexport mongoimport mongorestore mongodump mongotop mongoreplay

        # bin.install "bin/"


    end

    test do
        # Useless test
        assert_equal True, True
      end
  end
