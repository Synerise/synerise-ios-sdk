Pod::Spec.new do |s|
  s.name                  = "SyneriseSDK"
  s.version               = "5.10.1"
  s.summary               = "This is the Synerise iOS SDK (v. 5.10.1) for Synerise platform."
  s.description = <<-DESC
  Synerise is cutting-edge AI-driven infrastructure tailored for collecting, analyzing, and interpreting behavioral data.
  By leveraging the power of AI and machine learning, we transform raw behavioral data into actionable intelligence, 
  enabling organizations to make data-driven decisions with unprecedented accuracy and efficiency.
      DESC
  s.homepage              = "https://www.synerise.com"
  s.documentation_url     = "https://hub.synerise.com/developers/mobile-sdk/"
  s.social_media_url      = 'https://x.com/synerise'
  s.license               = { :type => "Apache License 2.0", :file => "LICENSE" }
  s.author                = { "Synerise" => "developer@synerise.com" }
  s.readme                = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/README.md'
  s.changelog             = 'https://github.com/Synerise/synerise-ios-sdk/blob/master/CHANGELOG.md'
  s.source                = { :git => 'https://github.com/Synerise/synerise-ios-sdk.git', :tag => s.version.to_s }
  s.exclude_files         = [ 'Pod/**', 'SampleAppSwift/**' ]
  s.frameworks            = 'Foundation', 'UIKit', 'UserNotifications', 'UserNotificationsUI', 'CoreData', 'WebKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreTelephony'
  s.library               = 'sqlite3'
  s.platform              = :ios, "13.0"
  s.swift_version         = '5.0'
  s.requires_arc          = true
  s.module_name           = "SyneriseSDK"
  s.xcconfig              = { "LIBRARY_SEARCH_PATHS" => '"$(PODS_ROOT)/SyneriseSDK"' }
  s.vendored_frameworks   = 'SDK/XCFramework/SyneriseSDK.xcframework'
  s.preserve_paths        = 'SDK/XCFramework/SyneriseSDK.xcframework/**'

end
