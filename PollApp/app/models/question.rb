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

  def results_joins
    acs_with_responses = self
      .answer_choices
      .select("answer_choices.*, COUNT(*) as response_count")
      .joins(:responses)
      .group("answer_choices.id")

    acs_with_responses.map do |ac|
      [ac.text, ac.response_count]
    end
  end

end
