#
# Be sure to run `pod lib lint LFYTextInputFilter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LFYTextInputFilter'
  s.version          = '0.1.1'
  s.summary          = 'A UITextField and UITextView Category can filter character'
  s.description      = <<-DESC
  'A 'UITextField' and 'UITextView' Category that can filter character, it filter you needn't character'
                       DESC
  s.homepage         = 'https://github.com/AbeiOS/LFYTextInputFilter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abei_os@126.com' => 'abei_os@126.com' }
  s.source           = { :git => 'https://github.com/AbeiOS/LFYTextInputFilter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'LFYTextInputFilter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LFYTextInputFilter' => ['LFYTextInputFilter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
