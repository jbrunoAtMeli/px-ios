Pod::Spec.new do |s|
    s.name             = 'AndesUI'
    s.version         = '3.19.0'
    
    s.author           = 'Mercado Libre'
    s.homepage         = 'https://github.com/mercadolibre/fury_andesui-ios'
    s.summary         = 'A cocoa pod containing..'
    s.license         =  { :type => 'BSD' }
    #s.source           = { :http => 'http://127.0.0.1:80/LibraryComponents.zip' }
    #s.source            = { :http => 'file:' + __dir__ + '/AndesUISource.zip' }
    #s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
    # s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
    s.source           = { :http => 'http://127.0.0.1/AndesUI_Release_3.15.0.precompiled.zip' }
    
    s.platform         = :ios, '10.0'
    s.swift_version = '5.0'
    s.requires_arc = true
    s.static_framework = true
    
    s.vendored_frameworks = "AndesUI.xcframework"
    
    
end









