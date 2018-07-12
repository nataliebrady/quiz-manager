class Answer < ApplicationRecord
  belongs_to :question
  validates :answer_title, presence: true, length: { maximum: 250 }
end
