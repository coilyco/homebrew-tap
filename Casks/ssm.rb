cask "ssm" do
  version "0.1.0"
  sha256 "2d1a0d0fd4dff9b44940f27c9dcc96bbcd4e28b7155bc420a2e8f5a14d208ae8"

  url "https://github.com/coilyco/ssm-app/releases/download/v#{version}/SSM-#{version}-arm64.zip"
  name "SSM"
  desc "Native app for AWS SSM Parameter Store"
  homepage "https://github.com/coilyco/ssm-app"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SSM.app"

  # Ad-hoc signed and not notarized, so Gatekeeper needs the quarantine flag cleared.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SSM.app"]
  end

  zap trash: "~/Library/Preferences/me.coilysiren.ssm.plist"
end
