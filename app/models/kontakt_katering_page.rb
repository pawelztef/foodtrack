class KontaktKateringPage < ActiveRecord::Base
  has_many :pageAdds, as: :addable
end
