class Ted < Formula
  desc "Terminal editor for tabular data"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ehfeng/ted/releases/download/v0.2.3/ted_0.2.3_Darwin_arm64.tar.gz"
      sha256 "4234d09ee7395c8cdf9af96883c495c2d415c621a31c1b766fad503acd3f5f25"
    else
      url "https://github.com/ehfeng/ted/releases/download/v0.2.3/ted_0.2.3_Darwin_amd64.tar.gz"
      sha256 "3ef4e54ef850fe92aa9308e040724583421a9a1979517a85231c9dbf23acdd15"
    end
  end

  def install
    bin.install "ted"

    # Generate shell completions
    bash_completion.install Utils.safe_popen_read(bin/"ted", "--completion=bash") => "ted"
    zsh_completion.install Utils.safe_popen_read(bin/"ted", "--completion=zsh") => "_ted"
    fish_completion.install Utils.safe_popen_read(bin/"ted", "--completion=fish") => "ted.fish"

    # PowerShell completions
    (pkgshare/"completions").install Utils.safe_popen_read(bin/"ted", "--completion=powershell") => "ted.ps1"
  end

  test do
    system "#{bin}/ted", "--help"
  end
end
