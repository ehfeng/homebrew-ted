# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "ca796943f276d8f1b0aa30903e4d55442a0fdea290df16e9f44d4ad61ff3c4c8"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "fc595380e34cb588290d819569d8b34cd6575ebbc8be5fe38607d843b788aa38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "9850c4e875c110b791e091da141efe63227f6c2fe5ec875a1bf09228feb68d37"
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
