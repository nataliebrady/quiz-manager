class AnsweredQuestion < ApplicationRecord
  alias_attribute :answer_ids, :answer_id
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :quiz
end
