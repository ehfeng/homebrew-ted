# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "fe41e61eefb3e50d89670efa7c579aec2c6733fa74f0f2c10d9d94f4b76cb571"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "73d3386ed64a39f53f6ac1fefcc80d2a8b89b80c8a7875ac4e64ad3ccf4f6306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "c0804276752b70cc8440852a26216fd8127fde027f1b7fa1ae09722ba4764f17"
    end
  end

  def install
    bin.install "ted"
    generate_completions_from_executable(bin/"ted", "completion")
  end

  test do
    system "#{bin}/ted", "--version"
  end
end
