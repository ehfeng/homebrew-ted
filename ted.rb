class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.3/ted_0.2.3_Darwin_arm64.tar.gz"
      sha256 "035c3f84e1307d693e3da21b6037fe57796e7b4699ca33eceb4789c342d7cec5"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.3/ted_0.2.3_Darwin_amd64.tar.gz"
      sha256 "c885b6c03aa40912f6ce246bfe340447e8267cfca001bff177dac2257c316c63"
    end
  end

  def install
    bin.install "ted"

    # Generate shell completions
    generate_completions_from_executable(bin/"ted", "--completion", shells: [:bash, :zsh, :fish])
  end

  test do
    system "#{bin}/ted", "--help"
  end
end
