class Stop < ActiveRecord::Base
  belongs_to :track
  before_save :set_active
  validates :address_line1, :address_line2, :town, :code, :date, presence: true
  validates :catchphrase, length: {maximum: 50}

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    return "#{self.address_line1} #{self.address_line2} #{self.town} #{self.code}"
  end

  private
  def set_active
    if self.active == true
      Stop.where.not(id: self.id).update_all(active: false)
    end
  end

end
