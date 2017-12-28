class Project < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :title, length: { minimum: 2, maxmum: 128 }
  validates :description, length: { minimum: 2 }

  mount_uploader :main_image, ImageUploader

  # don't forget those if you use :attr_accessible
  # (delete method and form caching method are provided by Carrierwave and used by RailsAdmin)
  # attr_accessor :main_image, :asset_cache, :remove_asset

  def status
    self.is_published ? 'unlock-alt' : 'lock'
  end

  def publish
    self.is_published ? '公開済み' : '非公開'
  end

  def image
    self.main_image.file.nil? ? 'default-thumbnail.jpg' : self.main_image
  end

end
