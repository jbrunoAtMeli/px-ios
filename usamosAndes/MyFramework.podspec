Pod::Spec.new do |s|
    s.name         = "MyFramework"
    s.version      = "1.0.0"
    s.summary      = "A brief description of MyFramework project."
    s.description  = <<-DESC
    An extended description of MyFramework project.
    DESC
    s.homepage     = "http://your.homepage/here"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2018
                   Permission is granted to...
                  LICENSE
                }
    #s.author             = { "$(git config user.name)" => "$(git config user.email)" }
    #s.source       = { :git => "$HOME/xcframework-cocoapods-tut/MyFrameworkDistribution.git", :tag => "#{s.version}" }
    s.author           = 'Mercado Libre'
    s.source           = { :http => 'http://127.0.0.1/MyFramework.xcframework.zip' }
    
    s.vendored_frameworks = "MyFramework.xcframework"
    s.platform = :ios
    s.swift_version = "4.2"
    s.ios.deployment_target  = '12.0'

end
