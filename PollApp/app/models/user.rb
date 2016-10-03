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
  end

end
