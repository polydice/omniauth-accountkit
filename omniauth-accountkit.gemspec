
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/accountkit/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-accountkit"
  spec.version       = Omniauth::Accountkit::VERSION
  spec.authors       = ["Richard Lee"]
  spec.email         = ["rl@polydice.com"]

  spec.summary       = %q{OmniAuth strategy for AccountKit}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/polydice/omniauth-accountkit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
