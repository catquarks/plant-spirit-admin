require 'rails_helper'

describe Feeling, type: :model do 
	describe 'Basic attributes' do 
		it 'is unique'

		it 'has a name' do 
			feeling = Feeling.create(name: 'Sadness')
			expect(feeling.name).to eq('Sadness')
		end

		it 'can only be assigned to flower_to_ease or flower_to_encourage'
	end

	describe 'Invalidations' do 
		
		it 'is invalid when assigned to a contextless flower'
		it 'cannot have a summary without a name'

		it 'is invalid as both a current and future feeling for the same flower'
end

