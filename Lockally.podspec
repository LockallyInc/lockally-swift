Pod::Spec.new do |s|
  s.name        = 'Lockally'
  s.version     = '0.1.0'
  s.summary     = 'Official Lockally SDK for iOS — transactional email, contacts, and agent inboxes.'
  s.homepage    = 'https://lockally.com'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.authors     = { 'Lockally' => 'support@lockally.com' }
  s.source      = { :git => 'https://github.com/lockallyinc/lockally-swift.git', :tag => "v#{s.version}" }

  s.ios.deployment_target     = '13.0'
  s.osx.deployment_target     = '10.15'
  s.tvos.deployment_target    = '13.0'
  s.watchos.deployment_target = '6.0'
  s.swift_version = '6.0'

  # Generated client + hand-written auth/ergonomics layer.
  s.source_files = 'Sources/Lockally/**/*.swift', 'Sources/LockallyKit/**/*.swift'
  s.frameworks   = 'Foundation'
end
