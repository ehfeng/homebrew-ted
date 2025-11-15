class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.3.2/ted_0.3.2_Darwin_arm64.tar.gz"
      sha256 "f08db6754ee68b4468476d2be27cda0ff25cbb97f08c5a572a47541ce9d1673d"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.3.2/ted_0.3.2_Darwin_amd64.tar.gz"
      sha256 "b6a6fe819ef5e959dc375d26d671d76a4f0b9d6086a68a696441ef5e20be5ced"
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
