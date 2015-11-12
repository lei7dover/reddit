class User < ActiveRecord::Base
  acts_as_authentic do |c|
     c.login_field :username
   end

  has_many :links
    validates_presence_of :name,:username, :password, :message => "missing"
  has_many :votes

  has_many :comments
end
