# config/initializers/blueprinter.rb
require 'oj'

Blueprinter.configure do |config|
  config.generator = Oj
  config.field_default = false
  config.association_default = {}
end