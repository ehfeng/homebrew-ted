# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "1b9be26342443f185227dd9322249b9f27be2d4324f7e421484c93fc60fe5353"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "ae10cb05f0437dab06f110eb86468d81b73777ac8e65ff34f1dd2bb6371e268b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "022560d14ff2a3cbdb907becd97f33a70bd418b0983a9784d179198a69cd84f9"
    end
  end

  def install
    bin.install "ted"
  end

  test do
    system "#{bin}/ted", "--version"
  end
end
