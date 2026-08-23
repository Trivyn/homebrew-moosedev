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
      url "https://github.com/Trivyn/moosedev/releases/download/v0.10.0/moosedev-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "8b07a5ea902a6aa57e6942d71a42c10a0e82cf7bb3d5fb363854c1d8c6f09940"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Trivyn/moosedev/releases/download/v0.10.0/moosedev-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ad002202b69ec3361c345934166cd06310d251536f0b00859c182b73a468143"
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
