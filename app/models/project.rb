class Project < ApplicationRecord
  belongs_to :user
  belongs_to :profile, foreign_key: 'user_id'
  validates :title, :description, presence: true
  validates :title, length: { minimum: 2, maxmum: 128 }
  validates :description, length: { minimum: 2 }

  mount_uploader :main_image, ImageUploader

  def status
    self.is_published ? 'unlock-alt' : 'lock'
  end

  def publish
    self.is_published ? '公開済み' : '非公開'
  end

  def image
    self.main_image.present? ? self.main_image : 'default-thumbnail.jpg'
  end

end
