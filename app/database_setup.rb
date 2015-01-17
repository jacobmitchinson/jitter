require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/jitter_#{env}")

require './app/models/jiit'
require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!