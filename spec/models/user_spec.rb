require 'rails_helper'

RSpec.describe User, type: :model do
	it 'has a unique username' do 
		user1 = User.create(username: 'Ringo', password: 'password')
		user2 = User.new(username: 'Ringo', password: 'password')
		expect(user2.valid?).to be(false)
	end
end
