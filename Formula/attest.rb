class Attest < Formula
  desc "Local completion-attestation gate for Claude Code subagents"
  homepage "https://github.com/ek33450505/attest"
  url "https://github.com/ek33450505/attest/archive/refs/tags/v0.3.0.tar.gz"
  # sha256 of the v0.3.0 github archive tarball (archive/refs/tags); verified byte-stable.
  sha256 "2feab11d44942be2f7821997e33fb1f048053dfa04abaa5b4ebfaa6565fc8bac"
  license "MIT"

  depends_on "python3" => :required

  def install
    # Stdlib-only: install the package + hooks + installer into libexec, then a
    # thin bin wrapper that runs the in-tree bin/attest (which resolves the
    # package from its own libexec location).
    libexec.install "attest", "hooks", "bin", "install.sh", "LICENSE", "README.md"

    (bin/"attest").write <<~SH
      #!/bin/bash
      exec python3 "#{libexec}/bin/attest" "$@"
    SH
  end

  def caveats
    <<~EOS
      The `attest` CLI is installed. To wire the SubagentStart/SubagentStop hooks
      into Claude Code, choose one:

        Plugin (recommended):
          /plugin marketplace add https://github.com/ek33450505/attest
          /plugin install attest@attest

        Manual (writes ~/.claude/settings.json):
          bash #{libexec}/install.sh

      Enforcement is OFF by default. Enable it per-session/environment with:
          export ATTEST_ENFORCE=1
    EOS
  end

  test do
    system "#{bin}/attest", "--version"
  end
end
