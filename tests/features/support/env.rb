require 'selenium-webdriver'
require 'site_prism'

include SitePrism

SitePrism.configure do | config |
  config.use_implicit_waits = true
end

ENV[ 'environment' ] ||= 'test'
puts "Running tests on #{ENV['environment'].upcase} environment"

CONFIG = YAML.load_file( 'environment.yaml' )