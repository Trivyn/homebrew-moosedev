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
      url "https://github.com/Trivyn/moosedev/releases/download/v0.11.1/moosedev-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "e786aae161d03d72f403fb8c54d56e5d77dc4a4a8c19c1d25e50da0265c40558"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.11.1/moosedev-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c854c920874eb1982e22c5024da5d6421f6013d980d18b3d66e641413253ddf1"
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
