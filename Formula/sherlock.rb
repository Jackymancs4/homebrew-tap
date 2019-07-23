class Sherlock < Formula
  include Language::Python::Virtualenv

  version '0.99.0-1'
  url 'https://github.com/Jackymancs4/sherlock/archive/4e04e122a0756e8f4839e79a77cbdbcf4d42453c.zip'
  sha256 "00473ce74c5aab0c77cb1dc1517ac19f763a16bf941f799cbf85d908e40759fa"

  depends_on 'python'

  patch do
    url "https://raw.githubusercontent.com/Jackymancs4/homebrew-tap/cfccaa04932296ae58320474c39e91c2f52e3b72/patches/sherlock.patch"
    sha256 "5e1d6a4bce98a189cbcc603ad4b5fa49ebb1b95ed5fd596713ed51c3d896be21"
  end

  def install
    venv = virtualenv_create(libexec, 'python3')

    requirements_list = []

    File.open("#{buildpath}/requirements.txt", 'r') do |f|
      f.each_line do |line|
        requirements_list.push line
      end
    end

    venv.pip_install requirements_list

    file_list = [
      'sherlock', 'sherlock.py', 'load_proxies.py', 'site_list.py', 'data.json'
    ]

    file_list.each do |r|
      prefix.install "#{buildpath}/#{r}"
    end

    prefix.install

    bin.install "#{prefix}/sherlock"
  end
end
