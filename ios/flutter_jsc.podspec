#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_jsc'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter ffi project'
  s.description      = <<-DESC
Provide JavaScriptCore feature in Flutter
                       DESC
  s.homepage         = 'https://github.com/xinfeng-tech/flutter_jsc'
  s.license          = { :type => "MIT", :file => '../LICENSE' }
  s.author           = { 'Meituan' => 'qianxinfeng@meituan.com' }
  s.source           = { :git => 'https://github.com/xinfeng-tech/flutter_jsc.git', :tag => "v#{s.version}" }
  s.source_files =  ['Classes/**/*', 'cpp/src/**/*.{h,c,cc}','cpp/include/*.h']
  s.public_header_files = ['Classes/**/*.h','cpp/include/*.h']
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.ios.frameworks = 'JavaScriptCore'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end

