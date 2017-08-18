class Query < ActiveRecord::Base
  # FULLNAME_REGEX = /\A[a-z,',-,ą,Ą,ę,Ę,ż,Ż,ć,Ć,ź,Ź,ó,Ó,ł,Ł]+(\s)[a-z,',-,ą,Ą,ę,Ę,ż,Ż,ć,Ć,ź,Ź,ó,Ó,ł,Ł]\z/
  FULLNAME_REGEX = /\A^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$\z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  validates :fullname, :email, :phone, :body, :town, presence: true
  validates_format_of :fullname, with: FULLNAME_REGEX
  validates_format_of :email, with: EMAIL_REGEX
  validates :phone, numericality: { only_integer: true }
end
