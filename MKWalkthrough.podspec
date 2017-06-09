#
# Be sure to run "pod lib lint MKWalkthrough.podspec" to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MKWalkthrough"
  s.version          = "1.0.3"
  s.summary          = "An iOS framework to create an engaging walkthrough with only one line of code."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An iOS framework to create an engaging walkthrough with only one line of code.
                       DESC

  s.homepage         = "https://github.com/minamakary25/MKWalkthrough-Swift"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "minamakary25" => "minamakary25@gmail.com" }
  s.source           = { :git => "https://github.com/minamakary25/MKWalkthrough-Swift.git", :branch => "master", :tag => s.version.to_s }
  # s.social_media_url = "https://twitter.com/<TWITTER_USERNAME>"

  s.ios.deployment_target = "8.0"

  s.source_files = "MKWalkthrough/Classes/**/*"
  
  # s.resource_bundles = {
  #   "MKWalkthrough" => ["MKWalkthrough/Assets/*.png"]
  # }

  # s.public_header_files = "Pod/Classes/**/*.h"
  # s.frameworks = "UIKit", "MapKit"
  # s.dependency "AFNetworking", "~> 2.3"
end
