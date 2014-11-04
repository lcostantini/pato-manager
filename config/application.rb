require 'ohm'

require './models/task'

require "./config/#{ ENV['RACK_ENV'] || 'development' }"