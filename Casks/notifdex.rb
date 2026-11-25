cask "notifdex" do
  version "0.1.0"
  sha256 "c4429e25ec33a486c13e86027bcb5d0dcb0081ab9dcf809d5c4a2296f0961119"

  url "https://github.com/notifdex/notifdex/releases/download/v#{version}/Notifdex-#{version}-macOS-universal.zip"
  name "Notifdex"
  desc "Local macOS notification inbox and people notebook"
  homepage "https://notifdex.com/"

  depends_on macos: ">= :sonoma"

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
