require 'data_mapper'
require './app/models/jiit'
require './app/database_setup'

task :auto_upgrade do
  DataMapper.finalize
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.finalize
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have been lost)"
end