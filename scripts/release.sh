#!/usr/bin/env bash
set -euo pipefail

# Creates a GitHub release and updates the Homebrew formula with the correct sha256.
#
# Usage: ./scripts/release.sh v0.1.0

VERSION="${1:?Usage: ./scripts/release.sh <version>}"
REPO="khalilkasmi/aws-config-gen"
TAP_DIR="${TAP_DIR:-../homebrew-tools}"
FORMULA="$TAP_DIR/Formula/aws-config-gen.rb"

echo "Creating release ${VERSION}..."

# Create and push tag
git tag -a "$VERSION" -m "Release $VERSION"
git push origin "$VERSION"

# Create GitHub release
gh release create "$VERSION" \
  --repo "$REPO" \
  --title "$VERSION" \
  --generate-notes

# Download tarball and compute sha256
tarball_url="https://github.com/${REPO}/archive/refs/tags/${VERSION}.tar.gz"
echo "Downloading tarball..."
sha=$(curl -sL "$tarball_url" | shasum -a 256 | cut -d' ' -f1)
echo "SHA256: $sha"

# Update formula
sed -i '' "s|url \".*\"|url \"${tarball_url}\"|" "$FORMULA"
sed -i '' "s|sha256 \".*\"|sha256 \"${sha}\"|" "$FORMULA"

echo ""
echo "Formula updated at $FORMULA"
echo "Now commit and push the tap:"
echo "  cd $TAP_DIR && git add -A && git commit -m 'aws-config-gen ${VERSION}' && git push"
