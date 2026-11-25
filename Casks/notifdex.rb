cask "notifdex" do
  version "0.1.3"
  sha256 "64d55e9109340116c2e8de25bb2da95903a7ea76d89add7779ccad473303378a"

  url "https://github.com/notifdex/notifdex/releases/download/v#{version}/Notifdex-#{version}-macOS-universal.zip"
  name "Notifdex"
  desc "Local macOS notification inbox and people notebook"
  homepage "https://notifdex.com/"

  depends_on macos: :sonoma

  app "Notifdex.app"

  uninstall quit: "com.notifdex.mac"

  zap trash: [
    "~/Library/Application Support/Notifdex",
    "~/Library/Preferences/com.notifdex.mac.plist",
  ]

  caveats <<~EOS
    Open Notifdex from Applications, click the menu bar icon, and grant
    Accessibility access in System Settings -> Privacy & Security -> Accessibility.

    For forwarded iPhone notifications, macOS 15 (Sequoia) and iOS 18 or later
    are required with iPhone Mirroring paired and "Allow notifications from iPhone"
    enabled in macOS System Settings.
  EOS
end
