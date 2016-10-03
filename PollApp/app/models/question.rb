class Question < ActiveRecord::Base
  # Associations:
  has_many :answer_choices
  belongs_to :poll
  has_many :responses, through: :answer_choices
  # Validations
  validates :poll, :text, presence: true

end
