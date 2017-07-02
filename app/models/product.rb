class Product < ActiveRecord::Base
  validates :name, :slug, :description, :image, presence: true
  mount_uploader :image, ImageUploader

  def update_slug
    self.slug = slug.parameterize
  end

  def to_param
    slug
  end
end
