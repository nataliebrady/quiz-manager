class Quiz < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  has_many :questions, dependent: :destroy
  has_many :answered_questions, through: :questions
  accepts_nested_attributes_for :answered_questions
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
