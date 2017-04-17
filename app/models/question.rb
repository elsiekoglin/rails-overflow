class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy, as: :commentable
  has_many :votes, dependent: :destroy, as: :votable

  validates_presence_of :title, :question_body, :user_id
end
