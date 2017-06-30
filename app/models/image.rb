class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  validates_presence_of :image_title
  belongs_to :post
end
