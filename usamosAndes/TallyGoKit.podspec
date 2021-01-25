Pod::Spec.new do |s|
    s.name             = 'TallyGoKit'
    s.version         = '3.15.0'
    
    s.author           = 'Mercado Libre'
    s.homepage         = 'https://github.com/mercadolibre/fury_andesui-ios'
    s.summary         = 'A cocoa pod containing..'
    s.license         =  { :type => 'BSD' }
    #s.source           = { :http => 'http://127.0.0.1/AndesUI_Release_3.15.0.precompiled.zip' }
    
    #s.source           = { :http => 'http://127.0.0.1/AndesWithFolder.zip' }
    
    
    #s.source            = { :http => 'file:' + __dir__ + '/AndesUISource.zip' }
    #s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
    # s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
         
    

    #s.platform         = :ios, '10.0'
    #s.swift_version = '5.0'
    #s.requires_arc = true
    #s.static_framework = true
    
    #s.ios.vendored_framework = 'AndesUI.xcframework'
    #s.public_header_files = "'AndesUI.xcframework/Headers/*.h"
    #s.source_files = "AndesUI.framework/Headers/*.h"

    s.platform          = :ios
    s.source            = { :http => 'https://github.com/tallygo/TallyGoKit/releases/download/2.2.1/TallyGoKit.zip' }

    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'TallyGoKit.framework'
    
    

    
    
end









