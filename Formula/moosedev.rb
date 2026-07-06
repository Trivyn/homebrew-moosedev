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
      url "https://github.com/Trivyn/moosedev/releases/download/v0.6.0/moosedev-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d152aa264d63749f55ed13b2dc83a8105f409636f2a6c76467a56a7480ce14b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.6.0/moosedev-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b052aadb608f7eb664c259085fc84eea98a572f40b2dba78bf7a96f6dcf2d9bf"
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
