class FuturePlantFeeling < ApplicationRecord
	belongs_to :encouraging_plant, class_name: 'Plant'
	belongs_to :future_feeling, class_name: 'Feeling'

	# validates_uniqueness_of :encouraging_plant
	# validates_uniqueness_of :future_feeling
end
