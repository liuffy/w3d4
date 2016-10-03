class Poll < ActiveRecord::Base
  # Associations:
  has_many :questions
  belongs_to :author, class_name: 'User'
  has_many :responses, through: :questions
  # Validations
  validates :title, :author, presence: true
end
