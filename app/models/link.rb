class Link < ActiveRecord::Base
  has_many :votes, dependent: :destroy
    validates_presence_of :title,:summary, :url, :message => "missing"
  belongs_to :user
end
