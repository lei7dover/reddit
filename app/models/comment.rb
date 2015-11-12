class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  validates :user_id, presence:true
  validates :link_id, presence:true
  validates :body, presence:true
end
