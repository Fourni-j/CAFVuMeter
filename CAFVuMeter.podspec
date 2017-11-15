#
# Be sure to run `pod lib lint CAFVuMeter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CAFVuMeter'
  s.version          = '0.1.0'
  s.summary          = 'Basic VU meter to display audio signal level'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Basic VU meter used to display audio signal level easily.
You can personalize the orientation (Left -> Right / Bottom -> Top),
you can also add a step where the VU Meter should change his color
DESC

  s.homepage         = 'https://github.com/fourni-j/CAFVuMeter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fourni-j' => 'charladfr@me.com' }
  s.source           = { :git => 'https://github.com/fourni-j/CAFVuMeter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CAFVuMeter/Classes/**/*'

  s.resource_bundles = {
    'CAFVuMeter' => ['CAFVuMeter/Assets/*.xib']
  }

  # s.resource_bundles = {
  #   'CAFVuMeter' => ['CAFVuMeter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
