class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.5/ted_0.2.5_Darwin_arm64.tar.gz"
      sha256 "f74419c2f59630c3a40b1e81b5c2d389c10da5c15cfc8dd0bcaa65171abdf13a"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.5/ted_0.2.5_Darwin_amd64.tar.gz"
      sha256 "c58109968a2f73172f6fb66f45ea1305016494fa407dfb61e32d42b77638294a"
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
