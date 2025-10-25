#!/bin/bash
set -e

# Check if VERSION is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <VERSION>"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION="$1"

echo "Fetching checksums for version ${VERSION}..."

# Download checksums file from GitHub release
CHECKSUMS_URL="https://github.com/ehfeng/ted/releases/download/v${VERSION}/checksums.txt"
curl -sL "$CHECKSUMS_URL" -o /tmp/ted-checksums.txt

# Extract checksums
DARWIN_ARM64=$(grep "Darwin_arm64" /tmp/ted-checksums.txt | awk '{print $1}')
DARWIN_X86_64=$(grep "Darwin_amd64" /tmp/ted-checksums.txt | awk '{print $1}')
LINUX_ARM64=$(grep "Linux_arm64" /tmp/ted-checksums.txt | awk '{print $1}')
LINUX_X86_64=$(grep "Linux_amd64" /tmp/ted-checksums.txt | awk '{print $1}')

echo "Darwin ARM64:   $DARWIN_ARM64"
echo "Darwin x86_64:  $DARWIN_X86_64"
echo "Linux ARM64:    $LINUX_ARM64"
echo "Linux x86_64:   $LINUX_X86_64"

# Update the formula
cat > ted.rb << EOF
# typed: true
# frozen_string_literal: true

# Formula for installing ted
class Ted < Formula
  desc "A Go binary utility"
  homepage "https://github.com/ehfeng/ted"
  version "${VERSION}"

  on_macos do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_arm64.tar.gz"
      sha256 "${DARWIN_ARM64}"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Darwin_x86_64.tar.gz"
      sha256 "${DARWIN_X86_64}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_arm64.tar.gz"
      sha256 "${LINUX_ARM64}"
    end
    on_intel do
      url "https://github.com/ehfeng/ted/releases/download/v#{version}/ted_#{version}_Linux_x86_64.tar.gz"
      sha256 "${LINUX_X86_64}"
    end
  end

  def install
    bin.install "ted"
  end

  test do
    system "#{bin}/ted", "--version"
  end
end
EOF

echo "✓ Formula updated with checksums for version ${VERSION}"
