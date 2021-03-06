cask "bbedit" do
  if MacOS.version <= :el_capitan
    version "12.1.6"
    sha256 "23b9fc6ef5c03cbcab041566503c556d5baf56b2ec18f551e6f0e9e6b48dc690"
  elsif MacOS.version <= :high_sierra
    version "12.6.7"
    sha256 "d0647c864268b187343bd95bfcf490d6a2388579b1f8fce64a289c65341b1144"
  else
    version "13.5.5"
    sha256 "6f5c0d71b8f1f385c3d775476d82fca71ddc3d04b5506f47fc8c8e7260650427"
  end
  url "https://s3.amazonaws.com/BBSW-download/BBEdit_#{version}.dmg",
      verified: "s3.amazonaws.com/BBSW-download/"
  name "BBEdit"
  desc "Text, code, and markup editor"
  homepage "https://www.barebones.com/products/bbedit/"

  livecheck do
    url "http://versioncheck.barebones.com/BBEdit.xml"
    regex(/BBEdit[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  auto_updates true
  depends_on macos: ">= :el_capitan"

  app "BBEdit.app"

  zap trash: [
    "~/Library/Application Support/BBEdit",
    "~/Library/Preferences/com.barebones.bbedit.plist",
    "~/Library/BBEdit",
    "~/Library/Caches/com.barebones.bbedit",
  ]
end
