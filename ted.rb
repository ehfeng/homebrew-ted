class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.4/ted_0.2.4_Darwin_arm64.tar.gz"
      sha256 "5be9ca1555909a4addcc979c71e87bf641882e67a32e57fb0b701cfc810f384d"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.4/ted_0.2.4_Darwin_amd64.tar.gz"
      sha256 "769449170a9b7f53fb4bfd790d823de820e7106e15d70e16d47dfd76fd6b9d33"
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
