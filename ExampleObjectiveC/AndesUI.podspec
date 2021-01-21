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
     s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }
         
    
    s.platform         = :ios, '10.0'
    s.swift_version = '5.0'
    s.requires_arc = true
    s.static_framework = true
    

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
    
end









