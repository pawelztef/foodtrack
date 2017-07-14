class Fpost < ActiveRecord::Base
  validates :body, presence: true
  validates :link_url, :format => URI::regexp(%w(http https)), allow_blank: true
  has_one :image, as: :imageable
end
