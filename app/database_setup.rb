env = ENV['RACK_ENV'] || 'development'

require './app/models/jiit'
require './app/models/user'

DataMapper.setup(:default, "postgres://localhost/jitter_#{env}")
DataMapper.finalize