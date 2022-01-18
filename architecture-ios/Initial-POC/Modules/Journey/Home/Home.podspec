Pod::Spec.new do |s|
    s.name             = 'Home'
    s.version          = '1.0.1'
    s.summary          = 'Home base library'
    s.description      = 'Library with Home classes'
  
    s.homepage         = 'https://github.com/FelippeMatos/multi-structural-module'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'giovane_barreira@hotmail.com' => 'giovane.barreira@avanade.com' }
    s.source           = { :git => 'https://github.com/FelippeMatos/multi-structural-module.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '11.0'
    s.exclude_files = 'Home/*.{plist}'
  
    s.source_files = 'Home', 'Home/**/*'
    s.dependency 'NetworkingInterfaces', '1.0.1'
    s.dependency 'AnalyticsInterfaces', '1.0.1'
    s.dependency 'Core', '1.0.1'
  end