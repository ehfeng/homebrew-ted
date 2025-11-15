class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.3.3/ted_0.3.3_Darwin_arm64.tar.gz"
      sha256 "66a408fdfbbb860e198892e36c96ad53d2544b435c9efc5e7df66641eb21d49e"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.3.3/ted_0.3.3_Darwin_amd64.tar.gz"
      sha256 "139ecb875adf82c286178c072649be577a9eecbfd7a9e9055270eac691694507"
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
