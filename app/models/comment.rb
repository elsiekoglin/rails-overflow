class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :votable, polymorphic: true

  validates_presence_of :comment_body, :user_id, :commentable_id, :commentable_type
end
