class Link < ActiveRecord::Base
  has_many :votes
    validates_presence_of :title,:summary, :url, :message => "missing"
end
