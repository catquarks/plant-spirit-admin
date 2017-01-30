class FuturePlantFeeling < ApplicationRecord
	belongs_to :encouraging_plant, class_name: 'Plant'
	belongs_to :future_feeling, class_name: 'Feeling'
end
