class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  # validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]
  # scope is ensuring that a user can only vote on something one time
end
