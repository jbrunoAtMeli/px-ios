Pod::Spec.new do |s|
    s.name             = 'AndesUI'
    s.version         = '3.20.1'
    
    s.author           = 'Mercado Libre'
    s.homepage         = 'https://github.com/mercadolibre/fury_andesui-ios'
    s.summary         = 'A cocoa pod containing..'
    s.source           = { :http => 'http://127.0.0.1:80/AndesUISource.zip' }
    #s.source            = { :http => 'file:' + __dir__ + '/AndesUISource.zip' }
    #s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
     
   
    s.platform         = :ios, '10.0'
    s.swift_version = '5.0'
    s.requires_arc = true
    s.static_framework = true
    s.frameworks = 'AndesUI'
    s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '/Applications/Xcode.app/Contents/Developer/Library/Frameworks' }
    s.vendored_frameworks = 'AndesUI.framework'

    s.default_subspec = 'Core'
    #s.ios.dependency 'YourPodName/YourPodDependencyFolder'

    s.source_files = "AndesUI/**/*.{swift}"

    s.subspec 'Core' do |core|
        core.source_files = 'LibraryComponents/Classes/Core/**/*.{h,m,swift}'
        core.resource_bundle = {'AndesUIResources' => ['LibraryComponents/Classes/Core/**/*.{xib}',
            'LibraryComponents/Resources/Core/Assets/AndesPaletteColors.xcassets', 'LibraryComponents/Resources/Core/Strings/*.lproj']}
        
        # remove this if we start using remote strategy for icons
        core.dependency 'AndesUI/LocalIcons'
    end
    s.subspec 'LocalIcons' do |la|
        la.resource_bundle = {'AndesIcons' => ['LibraryComponents/Resources/LocalIcons/Assets/Images.xcassets']}
    end

    s.subspec 'AndesBottomSheet' do |bottomsheet|
        bottomsheet.source_files = 'LibraryComponents/Classes/AndesBottomSheet/**/*.{h,m,swift}'
        
        bottomsheet.dependency 'AndesUI/Core'
    end

    s.subspec 'Default' do |default|
        default.source_files = ['MercadoPagoSDK/MercadoPagoSDK/**/**/**.{h,m,swift}']
        default.resources = ['MercadoPagoSDK/Resources/**/*.xib']
        default.resource_bundles = {
          'MercadoPagoSDKResources' => [
            'MercadoPagoSDK/Resources/**/*.xcassets',
            'MercadoPagoSDK/Resources/**/*.{lproj,strings,stringsdict}',
            'MercadoPagoSDK/Resources/**/*.plist'
          ]
        }
    end
end









