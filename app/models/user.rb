class User < ApplicationRecord
	has_secure_password

	validates :username, uniqueness: true, presence: true

	attr_reader :plant_spirit_history 

	# def initialize(*)
	# 	super
	# 	@plant_spirit_history = []
	# end

	# def add_to_history(last_action_performed)
	# 		# refactor later; this should act like a queue
	# 		self.plant_spirit_history << last_action_performed

	# end

end
