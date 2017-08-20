class SocialIcon < ActiveRecord::Base
  belongs_to :settings 
  mount_uploader :image, IconUploader
end
