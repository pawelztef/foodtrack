class Fpost < ActiveRecord::Base
  validates :title,  presence: true
  validates :link_url, :format => URI::regexp(%w(http https)), allow_blank: true
  mount_uploader :image, ImageUploader 
end
