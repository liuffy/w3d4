class Response < ActiveRecord::Base
  # Associations:
  belongs_to :answer_choice

  has_one :question, through: :answer_choice

  belongs_to :responder,
    foreign_key: :responder_id,
    class_name: 'User'

  # Validations
    validates :responder, :answer_choice, presence: true
    validate :author_must_not_respond
    validate :not_duplicate_response

  def not_duplicate_response
  # Check that the respondent has not previously answered this question. This is a
  # deceptively hard thing to do and will require several steps.
    if responder_already_answered?
       errors[:responder_id] << "You've already responded!!"
    else
      return true
    end
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id) #returns all response objects for the same question
  end

  def responder_already_answered?
    return true if sibling_responses.exists?(responder_id: self.responder_id)
  end

  def author_must_not_respond
    poll_author_id = self.answer_choice.question.poll.author_id

    if poll_author_id == self.responder_id
    errors[:responder_id] << "You wrote this poll, you can't respond!"
    end
  end

end
