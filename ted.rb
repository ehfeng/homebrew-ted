class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.3.1/ted_0.3.1_Darwin_arm64.tar.gz"
      sha256 "92cab46506c02dabd85f6440ba67d629973c7aa5184e5f33784dc34e943ca8bf"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.3.1/ted_0.3.1_Darwin_amd64.tar.gz"
      sha256 "7d08c1b25272d3740fc4262d083b4f4e54f4fb8c1dd8034146342a191ada2717"
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
