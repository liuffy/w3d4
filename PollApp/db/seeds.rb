# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  u1 = User.create!(user_name: "Alyssa")
  u2 = User.create!(user_name: "Coco")
  u3 = User.create!(user_name: "Alaska")

  p1 = Poll.create!(title: "Cats Poll", author_id: u1.id)
  p2 = Poll.create!(title: "Dogs Poll", author_id: u3.id)

  q1 = Question.create!(text: "What Cat Is Cutest?", poll_id: p1.id)
  ac1 = AnswerChoice.create!(text: "Markov", question_id: q1.id)
  ac2 = AnswerChoice.create!(text: "Curie", question_id: q1.id)
  ac3 = AnswerChoice.create!(text: "Sally", question_id: q1.id)

  q2 = Question.create!(text: "Which Toy Is Most Fun?", poll_id: p1.id)
  ac4 = AnswerChoice.create!(text: "String", question_id: q2.id)
  ac5 = AnswerChoice.create!(text: "Ball", question_id: q2.id)
  ac6 = AnswerChoice.create!(text: "Bird", question_id: q2.id)

  q3 = Question.create!(text: "Which Dog is the Worst?", poll_id: p2.id)
  ac7 = AnswerChoice.create!(text: "Pitbull", question_id: q3.id)
  ac8 = AnswerChoice.create!(text: "Corgi", question_id: q3.id)
  ac9 = AnswerChoice.create!(text: "Pug", question_id: q3.id)

  r1 = Response.create!(
    responder_id: u2.id, answer_choice_id: ac3.id
  )
  r2 = Response.create!(
    responder_id: u3.id, answer_choice_id: ac4.id
  )


  r3 = Response.create!(
    responder_id: u1.id, answer_choice_id: ac7.id
  )
  r4 = Response.create!(
    responder_id: u2.id, answer_choice_id: ac8.id
  )
end
