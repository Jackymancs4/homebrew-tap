class Sherlock < Formula
    include Language::Python::Virtualenv

    version "0.99.0-1"
    url "https://github.com/Jackymancs4/sherlock/archive/4e04e122a0756e8f4839e79a77cbdbcf4d42453c.zip"
    # sha256 ""

    depends_on "python"

    def install
        venv = virtualenv_create(libexec, "python3")

        requirements_list = []

        File.open("#{buildpath}/requirements.txt", "r") do |f|
            f.each_line do |line|
                requirements_list.push line
            end
          end

        venv.pip_install requirements_list

        prefix.install "#{buildpath}/sherlock", "#{buildpath}/sherlock.py", "#{buildpath}/load_proxies.py", "#{buildpath}/site_list.py", "#{buildpath}/data.json"

        # venv.pip_install_and_link buildpath

        bin.install "#{prefix}/sherlock"

    end
  end
