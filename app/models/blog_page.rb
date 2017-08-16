class BlogPage < ActiveRecord::Base
  has_many :pageAdds, as: :addable
  accepts_nested_attributes_for :pageAdds, reject_if: :all_blank, allow_destroy: true
end
