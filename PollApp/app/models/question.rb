class Question < ActiveRecord::Base
  # Associations:
  has_many :answer_choices
  belongs_to :poll
  has_many :responses, through: :answer_choices
  # Validations
  validates :poll, :text, presence: true

  def results_includes
    results = {}
    answer_choices = self.answer_choices.includes(:responses)

    answer_choices.each do |answer_choice|
    results[answer_choice.text] = answer_choice.responses.length #Due to ActiveRecord weirdness, use responses.length instead of responses.count
    end
    results
  end

  def results_

end
