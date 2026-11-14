# Homebrew Cask for Okena
# This file is automatically updated by CI on release.
# To install: brew tap contember/okena && brew install --cask okena

cask "okena" do
  arch arm: "arm64", intel: "x64"

  version "0.40.0"
  sha256 arm:   "77bbf16837adbb4859488547f330b1c4e84e1d8392a19ebb62c6e5f89f4edcba",
         intel: "943989c27841fd689118b3157d39a6cb8c15426fc16df53693b1cd21e8668650"

  url "https://github.com/contember/okena/releases/download/v#{version}/okena-macos-#{arch}.zip"
  name "Okena"
  desc "Terminal multiplexer for managing multiple terminal sessions"
  homepage "https://github.com/contember/okena"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Okena.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Okena.app"]
  end

  zap trash: [
    "~/.config/okena",
    "~/Library/Application Support/okena",
    "~/Library/Caches/okena",
    "~/Library/Preferences/com.contember.okena.plist",
  ]
end
