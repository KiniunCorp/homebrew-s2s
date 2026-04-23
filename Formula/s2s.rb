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
      sha256 "4492cc6ac96e1d4106cca3333bc8900d8f800bb8c861a3ac81d41dd9fc2b1442"
    end
    on_intel do
      url "https://github.com/KiniunCorp/spec-to-ship/releases/download/v0.2.56/s2s-0.2.56-macos-x64.tar.gz"
      sha256 "605fc8cb712adeeb35f02afb44f200a71c3bce251d767c66d3b52953f564faaf"
    end
  end

  def install
    bin.install "s2s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/s2s --version")
  end
end
