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
      url "https://github.com/Trivyn/moosedev/releases/download/v0.7.0/moosedev-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "3860f85c877d9d70e2950595eaf785e2c152369e5d51a0f026326b5bb1b09672"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.7.0/moosedev-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "821912203b2050c09d2a5af2af386108da09dc4ed98f594d17e06b85c7978534"
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
