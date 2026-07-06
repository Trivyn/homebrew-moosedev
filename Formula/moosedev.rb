# MOOSEDev — neurosymbolic MCP memory server for coding agents.
#
# Binary formula: the MOOSE engine is closed-source, so this downloads the
# pre-built release tarball rather than compiling from source. It lives in a
# custom tap (Trivyn/homebrew-moosedev), not homebrew/core. Regenerated on each
# release — edit packaging/homebrew/render-formula.sh, not this output.
class Moosedev < Formula
  desc "Neurosymbolic MCP server giving coding agents structured long-term memory"
  homepage "https://github.com/Trivyn/moosedev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.5.1/moosedev-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "3ceb243027a9fa6698dc2a69ebb4c596285d8eeb89c3c4718e7b4ea8c57ab4e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.5.1/moosedev-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3d96ea127176157f647732220a786b8d2317450fee7c5d9a18b5d81d13b4bf9"
    end
  end

  def install
    # Keep the binary's companion resources (ontologies/, skills/, templates/)
    # beside it so the exe-relative resolution finds them at runtime.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"moosedev"
  end

  test do
    assert_match "MCP", shell_output("#{bin}/moosedev --help")
  end
end
