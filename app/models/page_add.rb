class PageAdd < ActiveRecord::Base
  belongs_to :addable, polymorphic: true
end
