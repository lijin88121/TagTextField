Pod::Spec.new do |spec|

  spec.name         = "TagTextField"
  spec.version      = "0.0.1"
  spec.summary      = "SwiftUI Multiline Tag View with Text Input."
  spec.description  = <<-DESC
    TagTextField consists of Tags List and Text Input.
                   DESC

  spec.homepage     = "https://github.com/lijin88121/TagTextField"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Li Jin" => "lijin88121@gmail.com" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"
  
  spec.source       = { :git => "https://github.com/lijin88121/TagTextField.git", :tag => "#{spec.version}" }

  spec.source_files  = "TagTextField/**/*.{h,m,swift}"
end
