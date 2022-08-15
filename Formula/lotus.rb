# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Lotus < Formula
  desc "A homebrew cask for installing filecoin-project/lotus on MacOS"
  homepage "https://filecoin.io"
  version "1.17.1-rc2"
  license "MIT"
  depends_on :macos

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/v1.17.1-rc2/lotus_1.17.1-rc2_darwin_all.tar.gz"
    sha256 "78851bb3b7050441f6913a2ec0ce27c46998e33012be3609dad568fb2499685a"

    def install
      bin.install "lotus"
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  depends_on "pkg-config"
  depends_on "jq"
  depends_on "bzr"
  depends_on "hwloc"

  test do
    system "#{bin}/lotus --version"
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
