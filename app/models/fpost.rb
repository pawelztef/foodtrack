class Fpost < ActiveRecord::Base
  validates :body, presence: true
  has_one :image, as: :imageable
end
