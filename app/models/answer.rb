class Answer < ApplicationRecord
  belongs_to :question
  has_many :answered_questions
  validates :answer_title, presence: true, length: { maximum: 250 }
end
