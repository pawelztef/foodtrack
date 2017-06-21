class Stop < ActiveRecord::Base
  belongs_to :track

  validates :address_line1, :address_line2, :town, :code, :date, presence: true

  def full_street_address
    return "#{self.address_line1} #{self.address_line2} #{self.town} #{self.code}"
  end
end
