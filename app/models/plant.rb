class Plant < ApplicationRecord
	has_many :future_plant_feelings, foreign_key: 'encouraging_plant_id'
	has_many :future_feelings, class_name: 'Feeling', through: :future_plant_feelings
	has_many :current_plant_feelings, foreign_key: 'easing_plant_id'
	has_many :current_feelings, class_name: 'Feeling', through: :current_plant_feelings

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "1000x1000" },
		url: "/images/plants/:id/:style/:basename.:extension",
		path: ":rails_root/public/images/plants/:id/:style/:basename.:extension",
		default_url: "/images/plants/:id/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage/

  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]

	accepts_nested_attributes_for :future_feelings, reject_if: proc{|attributes| attributes['name'].blank?}, allow_destroy: false
	accepts_nested_attributes_for :current_feelings, reject_if: proc{|attributes| attributes['name'].blank?}, allow_destroy: false

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
