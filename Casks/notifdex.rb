cask "notifdex" do
  version "0.2.0"
  sha256 "9da0d14a7bc8473b80b440fdf1287322a0e871905a08fe4285983e60a4dfadae"

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
