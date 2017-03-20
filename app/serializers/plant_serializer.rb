class PlantSerializer < ActiveModel::Serializer 

	def thumb_pic
		object.image.url(:thumb)
	end

	def large_pic
		object.image.url(:large)
	end

	def medium_pic
		object.image.url(:medium)
	end

	attributes :id, :name, :thumb_pic, :large_pic, :image_credit_desc, :image_credit_url, :medium_pic, :summary, :future_feelings, :current_feelings
	has_many :current_feelings, serializer: PlantCurrentFeelingSerializer
	has_many :future_feelings, serializer: PlantFutureFeelingSerializer
end