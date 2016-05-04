Pod::Spec.new do |s|
  s.name             = "LVGSwiftAudioFileServices"
  s.version          = "0.0.1.beta.1"
  s.summary          = "A Swift wrapper around Audio Toolbox's Audio File Services."
  s.description      = <<-DESC
  LVGSwiftAudioFileServices wraps Audio Toolbox's Audio File Services in an easy to use set of Swift functions.
                       DESC

  s.homepage         = "https://github.com/letvargo/LVGSwiftAudioFileServices"
  s.license          = 'MIT'
  s.author           = { "Aaron Rasmussen" => "letvargo@gmail.com" }
  s.source           = { :git => 'https://github.com/letvargo/LVGSwiftAudioFileServices.git', :tag => '0.0.1.beta.1' }
  s.social_media_url = 'https://twitter.com/letvargo'
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.frameworks = 'AudioToolbox'
  s.dependency 'LVGUtilities', '~> 1.0'
end