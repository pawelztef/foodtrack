class HistoriaPage < ActiveRecord::Base
  has_many :pageAdds, as: :addable, dependent: :destroy
  accepts_nested_attributes_for :pageAdds, reject_if: :all_blank, allow_destroy: true
end
