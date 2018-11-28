Pod::Spec.new do |s|
  s.name             = "MercadoPagoSDK"
  s.version          = "3.8.0"
  s.summary          = "MercadoPagoSDK"
  s.homepage         = "https://www.mercadopago.com"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "Mercado Pago"
  s.source           = { :git => "https://github.com/mercadopago/px-ios.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.default_subspec = 'Default'

  s.subspec 'Default' do |default|
    default.resources = ['MercadoPagoSDK/MercadoPagoSDK/*.xcassets', 'MercadoPagoSDK/MercadoPagoSDK/*.ttf', 'MercadoPagoSDK/MercadoPagoSDK/*.lproj', 'MercadoPagoSDK/MercadoPagoSDK/Translations/**/**.{plist,strings}', 'MercadoPagoSDK/MercadoPagoSDK/Plist/*.plist', 'MercadoPagoSDK/MercadoPagoSDK/**/**.{xib,strings}']
    default.source_files = ['MercadoPagoSDK/MercadoPagoSDK/**/**/**.{h,m,swift}']
    s.dependency 'MercadoPagoPXTracking', '2.0.1.2'
    s.dependency 'MercadoPagoServices', '1.0.2.3'
  end

  s.swift_version = '3.0'



end