require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User 

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  property :email, String, :unique => true, :message => "This email is already taken"

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match."

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end