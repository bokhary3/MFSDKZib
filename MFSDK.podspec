Pod::Spec.new do |s|

s.name              = 'MFSDK'
s.version           = '1.0'
s.summary           = 'The MFSDK makes it easy to add MyFatoorah payments to mobile apps.'
s.homepage          = 'https://github.com/bokhary3/MFSDKZib'

s.author            = { 'MyFatoorah' => 'ehussein@myfatoorah.com' }
s.license           = { :type => 'Apache-2.0', :file => 'LICENSE.md' }

s.source            = { :git => "https://github.com/bokhary3/MFSDKZib.git", :tag => s.version.to_s}

s.xcconfig     =  { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/MFSDK/"' }

s.ios.deployment_target = '11.0'
s.ios.vendored_frameworks = 'MFSDK.framework'
s.requires_arc = true
s.source_files = 'MFSDK.framework/Headers/*.{h}'
s.vendored_frameworks = 'MFSDK.framework'
s.preserve_paths =  'MFSDK.framework/*'
end
