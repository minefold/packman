# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'packman/version'

Gem::Specification.new do |gem|
  gem.name          = "packman"
  gem.version       = Packman::VERSION
  gem.authors       = ["Dave Newman"]
  gem.email         = ["dave@minefold.com"]
  gem.description   = %q{Test Minefold funpacks}
  gem.summary       = %q{Test Minefold funpacks}
  gem.homepage      = "https://minefold.com"

  # gem.files         = `git ls-files`.split($/)
  # gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.executables   = ["packman"]
  gem.files = %w(
    Gemfile
    LICENSE.txt
    README.md
    Rakefile
    bin/packman
    packman.gemspec
  ) + Dir["lib/**/*"]

  %w(thor launchy).each do |dep|
    gem.add_dependency dep
  end
end
