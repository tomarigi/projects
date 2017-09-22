class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :project, foreign_key: 'user_id'
end
