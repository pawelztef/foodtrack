class HistoriaPage < ActiveRecord::Base
  has_many :pageAdds, as: :addable
end
