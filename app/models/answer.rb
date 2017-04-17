class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  validates_presence_of :answer_body, :user_id, :question_id
end
