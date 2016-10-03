class AnswerChoice < ActiveRecord::Base
  # Associations:
  belongs_to :question

  has_many :responses

  # Validations
  validates :question, :text, presence: true
end
