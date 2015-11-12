class Link < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :comments
    validates_presence_of :title,:summary, :url, :message => "missing"
  belongs_to :user
  validates_uniqueness_of :url
  before_validation :add_http
  belongs_to :subreddit

  validates_format_of :url, :with => /\Ahttp(|s):\/\//

  has_many :taggings
  has_many :tags, :through => :taggings
  def add_http
    unless self.url =~ /\Ahttp(|s):\/\//
      self.url = "http://" + self.url
    end
  end

  def tag_names=(tags)
    tags.split(",").collect{|t| t.strip}.each do |tag|
    this_tag=Tag.find_or_create_by(name: Tag.clean_name(tag))
    self.tags << this_tag
    end
  end

  def tag_names
    self.tags.collect{|t| t.name} .join (",")
  end

end
