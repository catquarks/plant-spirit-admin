class Plant < ApplicationRecord
	has_many :future_plant_feelings, foreign_key: 'encouraging_plant_id'
	has_many :future_feelings, class_name: 'Feeling', through: :future_plant_feelings
	has_many :current_plant_feelings, foreign_key: 'easing_plant_id'
	has_many :current_feelings, class_name: 'Feeling', through: :current_plant_feelings

	accepts_nested_attributes_for :future_feelings, reject_if: proc{|attributes| attributes['name'].blank?}, allow_destroy: true
	accepts_nested_attributes_for :current_feelings, reject_if: proc{|attributes| attributes['name'].blank?}, allow_destroy: true

	validates :name, presence: true, uniqueness: true

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
