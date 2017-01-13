Pod::Spec.new do |s|
  s.name         = "CSButton"
  s.version      = "0.3.2"
  s.summary      = "Custom the position of the ImageView relative to the titleLabel in UIButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Joslyn' => 'cs_joslyn@foxmail.com' }
  s.homepage     = 'https://github.com/chenaiwubu/CSButton'
  s.social_media_url   = "http://www.jianshu.com/u/fb676e32e2e9"

  s.ios.deployment_target = '7.0'


  s.source       = { :git => 'https://github.com/chenaiwubu/CSButton.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'CSButton/*.{h,m}'
  s.public_header_files = 'CSButton/*.{h}'

end
