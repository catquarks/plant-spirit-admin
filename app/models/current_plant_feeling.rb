class CurrentPlantFeeling < ApplicationRecord
	belongs_to :easing_plant, class_name: 'Plant'
	belongs_to :current_feeling, class_name: 'Feeling'

	# validates_uniqueness_of :easing_plant
	# validates_uniqueness_of :current_feeling
	# needs different validation where the easing_plant
	# and current_feeling cant be assigned twice

end
