class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.2/ted_0.2.2_Darwin_arm64.tar.gz"
      sha256 "22a61b4fa534f60f57386b0aaa4457f9038d11667db29ff28beb96da05129430"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.2/ted_0.2.2_Darwin_amd64.tar.gz"
      sha256 "3a49155b6ec0a4540537953c2983da762ac613352f3fd27b42efdcf002f71a84"
    end
  end

  def install
    bin.install "ted"
    generate_completions_from_executable(bin/"ted", "completion")
  end

  test do
    system "#{bin}/ted", "--help"
  end
end
