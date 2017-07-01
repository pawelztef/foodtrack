class Post < ActiveRecord::Base
  validates :title, :publish_date, presence: true
  validates :slug, uniqueness: true
  before_save :update_slug
  # mount_uploader :image, PostImageUploader 
  has_one :image


  def update_slug
    self.slug = slug.parameterize
  end

  def to_param
    slug
  end

end
