# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "90665489459a1fa7d66e41f38ffd2216c3cc9b1c33e8996206a7307936bad2bf"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "ted"
  end

  test do
    system "#{bin}/ted", "--version"
  end
end
