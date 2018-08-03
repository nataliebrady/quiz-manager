class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answered_questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :question_title, presence: true, length: { maximum: 250 }
  validates :answers, presence: true, length: { maximum: 250}
  validates_associated :answers
  validate :one_answer_only

  private 

  def one_answer_only 
  	if self.answers.map{|i| i.correct_answer == true}.count(true) > 1 || self.answers.map{|i| i.correct_answer == true}.count(true) < 1
  		errors.add(:answers, "One correct answer only")
  	end
  	
  end
end
