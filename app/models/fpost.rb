class Fpost < ActiveRecord::Base
  validates :body, presence: true
end
