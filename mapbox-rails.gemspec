 # coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mapbox-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "mapbox-rails"
  spec.version       = Mapbox::Rails::VERSION
  spec.authors       = ["Mark Madsen"]
  spec.email         = ["growl@agileanimal.com"]
  spec.description   = %q{Integrate MapBox.js with the Rails asset pipeline}
  spec.summary       = %q{Integrate MapBox.js with the Rails asset pipeline}
  spec.homepage      = "https://github.com/aai/mapbox-rails"
  spec.license       = "BSD and MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","vendor"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
