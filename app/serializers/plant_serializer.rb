class PlantSerializer < ActiveModel::Serializer 
	attributes :id, :name, :summary, :future_feelings, :current_feelings
	has_many :current_feelings, serializer: PlantCurrentFeelingSerializer
	has_many :future_feelings, serializer: PlantFutureFeelingSerializer
end