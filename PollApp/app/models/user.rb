class User < ActiveRecord::Base
  # Associations:
  has_many :responses,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: 'Response'

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Poll'

  # Validations
  validates :user_name, presence: true, uniqueness: true

  def not_duplicate_response

  # Write a custom validation method to check that
  # the respondent has not previously answered this question. This is a
  # deceptively hard thing to do and will require several steps:


  end

end
