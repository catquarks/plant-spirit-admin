class Feeling < ApplicationRecord
	has_many :future_plant_feelings, foreign_key: 'future_feeling_id'
	has_many :current_plant_feelings, foreign_key: 'current_feeling_id'
	has_many :encouraging_plants, through: :future_plant_feelings, foreign_key: 'future_feeling_id'
	has_many :easing_plants, through: :current_plant_feelings, foreign_key: 'current_feeling_id'

	accepts_nested_attributes_for :encouraging_plants, reject_if: proc{|attributes| attributes['name'].blank?}
	accepts_nested_attributes_for :easing_plants, reject_if: proc{|attributes| attributes['name'].blank?}

	validates :name, presence: true, uniqueness: true 

	# validate :cannot_be_current_feeling_and_future_feeling_for_same_plant

	def cannot_be_current_feeling_and_future_feeling_for_same_plant 
		unless (easing_plants & encouraging_plants).empty?
			errors.add(:feeling, 'This plant is already assigned to this feeling with the opposite relationship.')
		end
	end

	def short_summary
		if self.summary
			if summary.size > 100
				summary.slice(0, 99) + " [...]"
			else
				summary
			end
		end
	end

end
