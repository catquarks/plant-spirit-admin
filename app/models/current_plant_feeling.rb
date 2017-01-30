class CurrentPlantFeeling < ApplicationRecord
	belongs_to :easing_plant, class_name: 'Plant'
	belongs_to :current_feeling, class_name: 'Feeling'
end
