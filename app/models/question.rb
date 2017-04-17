class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :title, :question_body, :user_id
end
