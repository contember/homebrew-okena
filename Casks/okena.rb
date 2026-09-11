# Homebrew Cask for Okena
# This file is automatically updated by CI on release.
# To install: brew tap contember/okena && brew install --cask okena

cask "okena" do
  arch arm: "arm64", intel: "x64"

  version "0.32.0"
  sha256 arm:   "b64edb259d48474b88305b29f482606bc5ca56c2e1bd5e4f098b79869034641b",
         intel: "38aee534a86da9dbc33639fb31b014f82716101016ce745644c78a0589a6dd69"

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
