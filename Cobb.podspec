Pod::Spec.new do |spec|
spec.name         = "Cobb"
spec.version      = "0.2.1"
spec.summary      = "Swift dependency injection"
spec.description  = <<-DESC
Dependency injection library for Swift
DESC
spec.homepage     = "https://github.com/dariopellegrini/Cobb"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "author" => "pellegrini.dario.1303@gmail.com" }
spec.platforms = { :ios => "11.0", :osx => "10.15", :watchos => "6.0" }
spec.swift_version = "5.1"
spec.source       = { :git => "https://github.com/dariopellegrini/Cobb.git", :tag => "#{spec.version}" }
spec.source_files  = "Sources/Cobb/**/*.swift"
spec.xcconfig = { "SWIFT_VERSION" => "5.1" }
end
