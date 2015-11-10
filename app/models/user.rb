class User < ActiveRecord::Base
  has_many :links
    validates_presence_of :name,:username, :password, :message => "missing"
  has_many :votes
end
