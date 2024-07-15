Pod::Spec.new do |s|
  s.name                  = "SyneriseSDK"
  s.version               = "4.18.2"
  s.summary               = "This is the Synerise iOS SDK (v. 4.18.2) for Synerise platform."
  s.homepage              = "https://www.synerise.com"
  s.license               = { :type => "Apache License 2.0", :file => "https://github.com/Synerise/synerise-ios-sdk/blob/master/LICENSE" }
  s.authors               = "Synerise"
  s.readme                = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/README.md'
  s.changelog             = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/CHANGELOG.md'
  s.documentation_url     = "https://help.synerise.com"
  s.platform              = :ios, "9.0"
  s.source                = { :git => 'https://github.com/Synerise/synerise-ios-sdk.git', :tag => s.version.to_s }
  s.exclude_files         = [ 'Pod/**', 'SampleAppSwift/**' ]
  s.frameworks            = 'Foundation', 'UIKit', 'UserNotifications', 'WebKit', 'CoreTelephony'
  s.vendored_frameworks   = 'SDK/XCFramework/SyneriseSDK.xcframework'
  s.preserve_paths        = 'SDK/XCFramework/SyneriseSDK.xcframework/**'
  s.requires_arc          = true
  s.xcconfig              = { "LIBRARY_SEARCH_PATHS" => '"$(PODS_ROOT)/SyneriseSDK"' }
end
