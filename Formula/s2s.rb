# frozen_string_literal: true

# Homebrew formula for spec-to-ship (s2s).
#
# SHA256 checksums are updated automatically by the release workflow.
# After publishing a new spec-to-ship release, the GitHub Actions pipeline
# patches this file with the real version and checksums.
#
# Manual update checklist (if automation fails):
#   1. Get checksums: curl -sL https://github.com/KiniunCorp/spec-to-ship/releases/download/v{VERSION}/sha256sums.txt
#   2. Update version, both url fields, and both sha256 fields below.
#   3. Commit, push, and verify: brew audit --formula Formula/s2s.rb
#
# See docs/homebrew-distribution_en.md in the source repo for the full release workflow.
class S2s < Formula
  desc "Unified agentic SDLC orchestrator with engineering execution runtime"
  homepage "https://github.com/KiniunCorp/spec-to-ship"
  version "0.2.56"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/KiniunCorp/spec-to-ship/releases/download/v0.2.56/s2s-0.2.56-macos-arm64.tar.gz"
      sha256 "86b9bc244239ebde3df135e840ae7ca0f7daae36a17c0bea2a67e16c2058d623"
    end
    on_intel do
      url "https://github.com/KiniunCorp/spec-to-ship/releases/download/v0.2.56/s2s-0.2.56-macos-x64.tar.gz"
      sha256 "5534c1a93c5b8b3af3e6edb001fc659492811b69ac43acc36b4aa552f62d1042"
    end
  end

  def install
    bin.install "s2s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/s2s --version")
  end
end
