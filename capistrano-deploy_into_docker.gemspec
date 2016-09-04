# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/deploy_into_docker/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-deploy_into_docker"
  spec.version       = Capistrano::DeployIntoDocker::VERSION
  spec.authors       = ["Tatsuki Sugiura"]
  spec.email         = ["sugi@nemui.org"]

  spec.summary       = %q{Capistrano tasks to deploy into docker.}
  spec.description   = %q{Capistrano tasks to deploy into docker.}
  spec.homepage      = "http://github.com/sugi/capistrano-deploy_into_docker/"
  spec.license       = "MIT"

  ## Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  ## to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = Dir['lib/**/*.rb', 'lib/**/*.cap'] + %w(LICENSE README.md)
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "sshkit-backend-docker"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "rspec", "~> 3.0"
end
