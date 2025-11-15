class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.3.4/ted_0.3.4_Darwin_arm64.tar.gz"
      sha256 "5efb0c2436dda83e1887f1c4a18edd28095d10c9c0791d8960bb366df3bad0a8"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.3.4/ted_0.3.4_Darwin_amd64.tar.gz"
      sha256 "cb77393bad2f3c414b8a485b4c2899daafa9775db62d0fd423ab00851c77a9b0"
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
