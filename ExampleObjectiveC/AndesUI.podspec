Pod::Spec.new do |s|
    s.name             = 'AndesUI'
    s.version         = '3.19.0'
    
    s.author           = 'Mercado Libre'
    s.homepage         = 'https://github.com/mercadolibre/fury_andesui-ios'
    s.summary         = 'A cocoa pod containing..'
    s.license         =  { :type => 'BSD' }


    s.source           = { :http => 'http://127.0.0.1/AndesUI.zip' }
    #s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }

    s.platform         = :ios, '10.0'
    s.swift_version = '5.0'
    #s.requires_arc = true
    s.static_framework = true

    
    #s.frameworks = 'AndesUI'
    #s.default_subspec = 'Core'
    s.subspec 'AndesBottomSheet' do |bottomsheet|
        bottomsheet.source_files = 'LibraryComponents/Classes/AndesBottomSheet/**/*.{h,m,swift}'
        
        bottomsheet.dependency 'AndesUI/Core'
    end
    s.subspec 'Core' do |core|
        core.source_files = 'LibraryComponents/Classes/Core/**/*.{h,m,swift}'
        core.resource_bundle = {'AndesUIResources' => ['LibraryComponents/Classes/Core/**/*.{xib}',
            'LibraryComponents/Resources/Core/Assets/AndesPaletteColors.xcassets', 'LibraryComponents/Resources/Core/Strings/*.lproj']}
        
        # remove this if we start using remote strategy for icons
        core.dependency 'AndesUI/LocalIcons'
    end

    
   

    
    
    s.subspec 'AndesDropdown' do |dropdown|
        dropdown.source_files = 'LibraryComponents/Classes/AndesDropdown/**/*.{h,m,swift}'
        dropdown.resource_bundle = {'AndesDropdownResources' => ['LibraryComponents/Classes/AndesDropdown/**/*.{xib}']}
        
        dropdown.dependency 'AndesUI/Core'
        dropdown.dependency 'AndesUI/AndesBottomSheet'
    end
    
    s.subspec 'LocalIcons' do |la|
        la.resource_bundle = {'AndesIcons' => ['LibraryComponents/Resources/LocalIcons/Assets/Images.xcassets']}
    end

    
    
end









