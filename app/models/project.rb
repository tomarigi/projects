class Project < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :title, length: { minimum: 2, maxmum: 128 }
  validates :description, length: { minimum: 2 }
end
