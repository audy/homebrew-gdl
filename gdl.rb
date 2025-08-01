class Gdl < Formula
  desc "Command-line tool for downloading genome assemblies from NCBI GenBank and RefSeq"
  homepage "https://github.com/audy/gdl"
  url "https://github.com/audy/gdl/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "02abba04b23c60fad66778d1bfd10a04d944e71a6b8f2ee9cf39368c1d9a4320"
  license "MIT"

  depends_on "rust" => [:build, :optional]

  on_macos do
    on_intel do
      sha256 '84e32bf0a9be99d39d3a66664716bcfb30f28bb166f9262d0a975752388d11e1'
      url 'https://github.com/audy/gdl/releases/download/v0.0.3/gdl-x86_64-apple-darwin.tar.gz'
    end

    on_arm do
      sha256 '31c2995d6415bd6ffd7f030d00459cc12bd1c96438089c4c5c8d04a6f1ac127a'
      url 'https://github.com/audy/gdl/releases/download/v0.0.3/gdl-aarch64-apple-darwin.tar.gz'
    end
  end

  on_linux do
    on_intel do
      sha256 'd41f264c6d86b6d0f1fd5aa929e021e34f778e1bcb03619365f56a63abb6ecfc'
      url 'https://github.com/audy/gdl/releases/download/v0.0.2/gdl-x86_64-unknown-linux-musl.tar.gz'
    end
  end

  def install
    if build.with? "rust"
      system "cargo", "install", *std_cargo_args
    else
      bin.install "gdl"
    end
  end

  test do
    system "#{bin}/gdl", "--help"
  end
end
