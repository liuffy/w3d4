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

  # Poll.find_by_sql(<<-SQL)
  #   SELECT
  #     polls.*
  #   FROM
  #     polls
  #   JOIN
  #     questions
  #   ON
  #     poll.id = questions.poll_id
  #   LEFT OUTER JOIN(
  #     SELECT
  #       *
  #     FROM
  #       responses
  #     WHERE
  #       responder_id = #{self.id}
  #     ) AS responses
  #     ON
  #       answer_choices.id = responses.answer_choice_id
  #     GROUP BY
  #       polls.id
  #     HAVING
  #       COUNT(questions.id) = COUNT(responses.id)
  #   )
  # SQL
  # end

  def completed_polls
    polls_with_completion_counts.having('COUNT(questions.id) = COUNT(responses.id)')
  end

  def polls_with_completion_counts
    responses_from_user = <<-SQL
      LEFT OUTER JOIN (
        SELECT
          *
        FROM
          responses
        WHERE
          responder_id = #{self.id}
      ) AS responses ON answer_choices.id = responses.answer_choice_id
    SQL

    Poll.joins(questions: :answer_choices) #join questions on answer choices
        .joins(responses_from_user) 
        .group('polls.id')
  end
end
