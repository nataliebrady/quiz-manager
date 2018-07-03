class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  validates :question_title, presence: true, length: { maximum: 250 }
end
