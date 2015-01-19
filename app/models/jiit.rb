require 'data_mapper'
require 'dm-postgres-adapter'

class Jiit

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :time, DateTime

  belongs_to :user

end
