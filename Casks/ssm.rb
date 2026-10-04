cask "ssm" do
  version "0.1.1"
  sha256 "d42952acb8cf184f41c6688a81add9618857fe357417d736e273cb0a4a59649d"

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
