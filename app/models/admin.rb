class Admin < ActiveRecord::Base

  include Reuseable


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable



  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :phone, presence: true
  validates :phone, numericality: { only_integer: true }
  validates :address_line1, presence: true
  validates :address_line2, presence: true
  validates :code, presence: true
  validates :town, presence: true
  validates :email, presence: true



  def self.clear_expired
    Admin.invitation_not_accepted.map { |c| c.destroy unless c.valid_invitation? }
  end

end
