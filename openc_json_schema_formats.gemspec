# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openc_json_schema_formats/version'

Gem::Specification.new do |spec|
  spec.name          = "openc_json_schema_formats"
  spec.version       = OpencJsonSchemaFormats::VERSION
  spec.authors       = ["TODO: Write your name"]
  spec.email         = ["seb.bacon@gmail.com"]

  spec.summary       = %q{Custom validators required by openc's schemas}
  spec.description   = %q{Custom JSON validators required by openc's schemas, as implemented by json_validator gem}
  spec.homepage      = "http://github.com/openc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json_validation"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
