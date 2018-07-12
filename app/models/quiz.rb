class Quiz < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
