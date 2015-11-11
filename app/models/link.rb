class Link < ActiveRecord::Base
  has_many :votes, dependent: :destroy
    validates_presence_of :title,:summary, :url, :message => "missing"
  belongs_to :user
  validates_uniqueness_of :url
  before_validation :add_http
  belongs_to :subreddit

  validates_format_of :url, :with => /\Ahttp(|s):\/\//

  def add_http
    unless self.url =~ /\Ahttp(|s):\/\//
      self.url = "http://" + self.url
    end
  end

end
