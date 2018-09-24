
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tiny_dancer/version"

Gem::Specification.new do |spec|
  spec.name     = "tiny_dancer"
  spec.version  = TinyDancer::VERSION
  spec.authors  = ["Z. Grace Moreau"]
  spec.email    = ["zgm@inescapable.org"]

  spec.summary  = "A command-line interface to TinyPNG."
  spec.date     = "2018-09-22"
  spec.homepage = "https://github.com/zgracem/tiny_dancer"
  spec.license  = "MIT"

  spec.files    = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0")
  end

  spec.require_paths = ["lib"]
  spec.bindir   = "bin"
  spec.executables = ["tinypng", "tinyjpg"]
end
