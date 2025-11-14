class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.7/ted_0.2.7_Darwin_arm64.tar.gz"
      sha256 "7ce32dbe9d83261690dc37e2f960ae3bcb269095004543d8c809ab9519c61d7a"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.7/ted_0.2.7_Darwin_amd64.tar.gz"
      sha256 "384bf4e35cc794f85e159c6fdc0d1edc414721f3539c1315702d8cc6c230cbc0"
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
