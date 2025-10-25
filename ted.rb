# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "90665489459a1fa7d66e41f38ffd2216c3cc9b1c33e8996206a7307936bad2bf"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "7e7f5517c7523d6bee49a2e5d3d898a37d718463c6287da61e78bf68272ce3ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "3e0e62f625df4993e3d5c29523dcba1444395cb001a8b4431307f6c55e04a2fd"
    end
  end

  def install
    bin.install "ted"
  end

  test do
    system "#{bin}/ted", "--version"
  end
end
