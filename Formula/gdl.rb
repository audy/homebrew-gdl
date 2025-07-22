class Gdl < Formula
  desc "Command-line tool for downloading genome assemblies from NCBI GenBank and RefSeq"
  homepage "https://github.com/audy/gdl"
  url "https://github.com/audy/gdl/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "0619c7fc0d98f1c860bc59c3e6a97a3fa28c94b7b3b53641662f08e3aeddcec0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gdl", "--help"
  end
end