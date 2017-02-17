class FeelingSerializer < ActiveModel::Serializer 
	attributes :id, :name, :summary, :encouraging_plants, :easing_plants
	has_many :encouraging_plants, serializer: FeelingEncouragingPlantSerializer
	has_many :easing_plants, serializer: FeelingEasingPlantSerializer
end