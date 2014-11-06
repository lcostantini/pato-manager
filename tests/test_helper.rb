ENV['RACK_ENV'] = 'test'
ENV['REDISTOGO_URL'] = "redis://localhost:6379/2"

require './config/application'

prepare do
  Ohm.flush
end
