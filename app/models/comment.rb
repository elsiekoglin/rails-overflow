class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates_presence_of :comment_body, :user_id
end
