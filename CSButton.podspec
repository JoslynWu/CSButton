Pod::Spec.new do |s|
  s.name         = "CSButton"
  s.version      = "0.5.2"
  s.summary      = "Custom the position of the ImageView relative to the titleLabel in UIButton. \n 
  一个UIButon的Category，可以调整图片与文字相对位置，图片和文字间距，指定文字宽度，以及图片显示大小。"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Joslyn' => 'cs_joslyn@foxmail.com' }
  s.homepage     = 'https://github.com/chenaiwubu/CSButton'
  s.social_media_url   = "http://www.jianshu.com/u/fb676e32e2e9"
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/chenaiwubu/CSButton.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'Sources/*.{h,m}'
  s.public_header_files = 'Sources/*.{h}'

end
