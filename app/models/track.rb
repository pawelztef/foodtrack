class Track < ActiveRecord::Base
  has_many :stops, dependent: :destroy

  validates :route_name, :driver, :truck, :description, presence: true

  accepts_nested_attributes_for :stops, reject_if: :all_blank, allow_destroy: true
end
