class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.2/ted_0.2.2_Darwin_arm64.tar.gz"
      sha256 "c224f0d610c3ee0dc63854b03536fc7fee2830aede219a0a4ad606db5eee82c2"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.2/ted_0.2.2_Darwin_amd64.tar.gz"
      sha256 "48dd15431a6ba1acb23ec5025a533e34849d7a253b7430b9cfe1ed943ba3db10"
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
