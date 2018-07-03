class Quiz < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  has_many :questions
  has_many :answers
  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :answers
end
