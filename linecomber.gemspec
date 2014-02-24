# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linecomber/version'

Gem::Specification.new do |spec|
  spec.name          = "linecomber"
  spec.version       = Linecomber::VERSION
  spec.authors       = ["Barry"]
  spec.email         = ["bsia@mocana.com"]
  spec.description   = %q{A command-line tool for iterating through text files line by line.}
  spec.summary       = %q{Comb through text files line by line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activesupport"
#  spec.add_development_dependency "cucumber"
#  spec.add_development_dependency "aruba"
#  spec.add_development_dependency "thor"
end
