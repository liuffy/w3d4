class Movie < ActiveRecord::Base
	belongs_to :director,
		class_name: "Actor"
	has_many :castings
	has_many :actors, through: :castings

  # Movie belongs to director
  # Movie has many castings
  # Movie has many castings, THROUGH actors 
end
