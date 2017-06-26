class Post < ActiveRecord::Base
  validates :title, :publish_date, presence: true
end
