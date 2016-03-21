Pod::Spec.new do |s|

  s.name         = "Fuzzer"
  s.version      = "0.3.0"
  s.summary      = "Do not crash when your server lies"

  s.homepage     = "https://github.com/AlexDenisov/Fuzzer"
  s.license      = "MIT"
  s.author             = { "AlexDenisov" => "1101.debian@gmail.com" }
  s.social_media_url   = "https://twitter.com/1101_debian"

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/AlexDenisov/Fuzzer.git", :tag => "0.2.0" }
  s.source_files  = "Fuzzer/**/*.{h,m}"
  s.public_header_files = "Fuzzer/Fuzzer.h", "Fuzzer/Runners/FZRRunner.h", "Fuzzer/Reports/FZRReport.h", "Fuzzer/Mutations/FZRMutation.h", "Fuzzer/Factories/FZRMutationFactory.h", "Fuzzer/Replacements/FZRNodeReplacement.h"
  s.header_dir = "Fuzzer"

  s.requires_arc = true
end
