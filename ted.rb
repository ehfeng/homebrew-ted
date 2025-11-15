class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.3.0/ted_0.3.0_Darwin_arm64.tar.gz"
      sha256 "df38ba435ff886c227641012afb28bc6113b8b5946abc3100f07569130a6b271"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.3.0/ted_0.3.0_Darwin_amd64.tar.gz"
      sha256 "3aedcecb6782a39b005e3ec0073c97ed82410a4a6376436a8fc31001bd813b1e"
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
