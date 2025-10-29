# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "9a694d0f81fca82f36ec0b32ab7a3e3551df30e4013727a7bed097629593be43"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "d940021670107e4cb21cd8dc98641d274ad3949f924ab8d32fe378db613f957a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "b4718214929184feffdb6f42c59f8d46ea8832ef564c720cedd9f9c0fd533a79"
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
