class BuildTfidf < Formula
  include Language::Python::Virtualenv

  desc "High-quality semantic search for Markdown corpora"
  homepage "https://github.com/joshuascottpaul/build_tfidf"
  url "https://github.com/joshuascottpaul/build_tfidf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"

  depends_on "python@3.10"

  # NOTE: Use `brew update-python-resources build-tfidf` to vendor resources
  # from requirements.txt before release.

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/tfidf-search"
  end

  test do
    system bin/"tfidf-search", "--help"
    (testpath/"corpus").mkpath
    (testpath/"corpus/alpha.md").write "# Alpha\n\nalpha note"
    system bin/"tfidf-search", "build", "--root", testpath/"corpus"
  end
end
