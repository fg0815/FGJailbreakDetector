Pod::Spec.new do |s|
  s.name             = "FGJailbreakDetector"
  s.version          = "0.1.0"
  s.summary          = "Detect if the device is jailbroken"
  s.description      = 'Using 3 ways to detect if the device is jailbroken'
  s.homepage         = "https://github.com/fg0815/FGJailbreakDetector"
  s.license          = 'MIT'
  s.author           = { "Feng Guo" => "feng.guo.aus@gmail.com" }
  s.source           = { :git => "https://github.com/fg0815/FGJailbreakDetector.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'FGJailbreakDetector/FGJailbreakDetector/*.{h,m}'
end
