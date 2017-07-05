class Product < ActiveRecord::Base
  validates :name, :slug, :description, :image, presence: true
  mount_uploader :image, ImageUploader
  before_save :update_slug

  def update_slug
    self.slug = slug.parameterize
  end

  def to_param
    slug
  end
end
