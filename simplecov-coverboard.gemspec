$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "simplecov-coverboard/version"

Gem::Specification.new do |gem|
  gem.name        = "simplecov-coverboard"
  gem.version     = SimpleCov::Formatter::CoverBoardFormatter::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ["Michal Franczak", "Lautaro Mazzitelli"]
  gem.homepage    = "https://github.com/coverboard/simplecov-coverboard"
  gem.description = %(Simplecov formatter which sends metrics to CoverBoard)
  gem.summary     = gem.description
  gem.license     = "MIT"

  gem.required_ruby_version = ">= 1.9.2"
  gem.add_development_dependency "bundler", "~> 1.9"
  gem.add_runtime_dependency "simplecov", "~> 0.9"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ["lib"]
end
