class Profile < ApplicationRecord
  belongs_to :user
  has_one :project, foreign_key: 'user_id'
end
