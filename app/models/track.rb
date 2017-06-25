class Track < ActiveRecord::Base
  before_save :set_active_flag
  has_many :stops, dependent: :destroy
  validates :route_name, :driver, :truck, :description, presence: true
  accepts_nested_attributes_for :stops, reject_if: :all_blank, allow_destroy: true


  private
  def set_active_flag
    if self.active == true
      Track.where.not(id: self.id).update_all(active: false)
    else 
    end
  end
end
