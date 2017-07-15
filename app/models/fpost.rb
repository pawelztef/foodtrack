class Fpost < ActiveRecord::Base
  validates :body, :title,  presence: true
  validates :link_url, :format => URI::regexp(%w(http https)), allow_blank: true
  has_one :image, as: :imageable
  accepts_nested_attributes_for :image, reject_if: :all_blank, allow_destroy: true
end
