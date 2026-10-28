class Umbra < Formula
  desc "Generate guarded CLIs from KDL policy and committed API locks"
  homepage "https://github.com/coilyco/umbra"
  version "0.259.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.259.0/umbra-darwin-amd64"
      sha256 "2b0b774d8379c6356056af8f23d04f0317d6b672bdd44c4f9023ee869a626ecd"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.259.0/umbra-darwin-arm64"
      sha256 "d14bb420c71c5923822d93d07bbb3ac30716e117435e9923ff6bdb7a9b0d6774"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/umbra/releases/download/v0.259.0/umbra-linux-amd64"
      sha256 "40a2a6b6e14049cdb80576ca232e78299d492c86ec189d4a3f6c85b0aefee96c"
    end
    on_arm do
      url "https://github.com/coilyco/umbra/releases/download/v0.259.0/umbra-linux-arm64"
      sha256 "ebcf267f392900594fe77c5c4f354df9399a50b6be00153a063637f31d850c4a"
    end
  end

  def install
    bin.install Dir["umbra-*"].first => "umbra"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/umbra --version")
  end
end
