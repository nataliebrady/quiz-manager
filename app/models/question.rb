class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers
  validates :question_title, presence: true, length: { maximum: 250 }
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
