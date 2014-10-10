class Image < ActiveRecord::Base
  has_many :images_tags
  has_many :tags, through: :images_tags
  validates :url, uniqueness: true
end
