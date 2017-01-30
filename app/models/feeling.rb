class Feeling < ApplicationRecord
	has_many :future_plant_feelings, foreign_key: 'future_feeling_id'
	has_many :current_plant_feelings, foreign_key: 'current_feeling_id'
	has_many :encouraging_plants, through: :future_plant_feelings, foreign_key: 'future_feeling_id'
	has_many :easing_plants, through: :current_plant_feelings, foreign_key: 'current_feeling_id'

	validates :name, presence: true, uniqueness: true

end
