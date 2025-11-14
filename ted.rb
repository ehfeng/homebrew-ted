class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.6/ted_0.2.6_Darwin_arm64.tar.gz"
      sha256 "e73688ce4c0b43dcaf2074e0f6d243ab4b8237381280f97e00e8389219521147"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.6/ted_0.2.6_Darwin_amd64.tar.gz"
      sha256 "519ebab77a321db92aedbdadb8b2d4e4f579c0175b1cbcae2ec65e3f377d11f6"
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
