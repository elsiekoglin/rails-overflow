class Answer < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :question
  has_many :votes, dependent: :destroy, as: :votable

  validates_presence_of :answer_body, :user_id, :question_id
end
