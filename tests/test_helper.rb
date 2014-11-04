ENV['RACK_ENV'] = 'test'

require './config/application'

Ohm.redis = Redic.new("redis://localhost:6379/2")

prepare do
  Ohm.flush
end
