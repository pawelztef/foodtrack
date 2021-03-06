class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  belongs_to :imageable, polymorphic: true
end
