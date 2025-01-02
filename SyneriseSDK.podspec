Pod::Spec.new do |s|
  s.name                  = "SyneriseSDK"
  s.version               = "4.24.1"
  s.summary               = "This is the Synerise iOS SDK (v. 4.24.1) for Synerise platform."
  s.homepage              = "https://www.synerise.com"
  s.license               = { :type => "Apache License 2.0", :file => "LICENSE" }
  s.authors               = "Synerise"
  s.readme                = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/README.md'
  s.changelog             = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/CHANGELOG.md'
  s.documentation_url     = "https://hub.synerise.com/developers/mobile-sdk/"
  s.platform              = :ios, "9.0"
  s.source                = { :git => 'https://github.com/Synerise/synerise-ios-sdk.git', :tag => s.version.to_s }
  s.exclude_files         = [ 'Pod/**', 'SampleAppSwift/**' ]
  s.frameworks            = 'Foundation', 'UIKit', 'UserNotifications', 'WebKit', 'CoreTelephony'
  s.vendored_frameworks   = 'SDK/XCFramework/SyneriseSDK.xcframework'
  s.preserve_paths        = 'SDK/XCFramework/SyneriseSDK.xcframework/**'
  s.swift_version         = '5.0'
  s.requires_arc          = true
  s.xcconfig              = { "LIBRARY_SEARCH_PATHS" => '"$(PODS_ROOT)/SyneriseSDK"' }
end
