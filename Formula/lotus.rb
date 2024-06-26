# typed: false
# frozen_string_literal: true

# This is modified by https://github.com/filecoin-project/lotus/actions/workflows/release.yml. DO NOT EDIT.
class Lotus < Formula
  desc "A homebrew cask for installing filecoin-project/lotus on MacOS"
  homepage "https://filecoin.io"
  version "1.27.1"
  license "MIT"

  depends_on "hwloc"

  resource "node" do
    on_macos do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.27.1/lotus_v1.27.1_darwin_all.tar.gz"
      sha256 "6f9963b4b8435812d92d70b59331429e002cc055385769b87932300da708e450"
    end
    on_linux do
      on_intel do
        if Hardware::CPU.is_64_bit?
          url "https://github.com/filecoin-project/lotus/releases/download/v1.27.1/lotus_v1.27.1_linux_amd64.tar.gz"
          sha256 "ed7c877929492175cf9eecbb647544af2720640d06d581ab72239a265d5fa3d6"
        end
      end
    end
  end

  resource "miner" do
    on_macos do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.27.1/lotus_v1.27.1_darwin_all.tar.gz"
      sha256 "6f9963b4b8435812d92d70b59331429e002cc055385769b87932300da708e450"
    end
    on_linux do
      on_intel do
        if Hardware::CPU.is_64_bit?
          url "https://github.com/filecoin-project/lotus/releases/download/v1.27.1/lotus_v1.27.1_linux_amd64.tar.gz"
          sha256 "ed7c877929492175cf9eecbb647544af2720640d06d581ab72239a265d5fa3d6"
        end
      end
    end
  end

  def install
    resource("node").stage do
      bin.install "lotus"
    end
    resource("miner").stage do
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  test do
    system "#{bin}/lotus --version"
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
