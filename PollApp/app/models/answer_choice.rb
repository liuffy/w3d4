class AnswerChoice < ActiveRecord::Base
  # Associations:
  belongs_to :question

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'Response'

  # Validations
  validates :question, :text, presence: true
end
