# Homebrew Cask for Okena
# This file is automatically updated by CI on release.
# To install: brew tap contember/okena && brew install --cask okena

cask "okena" do
  arch arm: "arm64", intel: "x64"

  version "0.41.2"
  sha256 arm:   "bf9754138b0aa449b5b4f0d69438779c8edab4a6e9b0559a60229e1f5f607b62",
         intel: "0901f35c9597d633857526dd5977a85be1a25aefac25342d9c27eb959a1ff5b7"

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
