require 'rails_helper'

describe Plant, type: :model do 
	describe 'Basic attributes' do 
		it 'has a unique name'

		it 'has a name' do 
			plant = Plant.create(name: 'Flora')
			expect(plant.name).to eq('Flora')
		end

		it 'has a summary'
		it 'has at least one future feeling'
		it 'has at least one current feeling'

	end

	describe 'Invalidations' do 
		
		it 'is invalid without a name' do 
			plant = Plant.new(summary: 'Flora')
			expect(plant.valid?).to be(false)
		end

		it 'is invalid without a summary'
		it 'is invalid without at least one future feeling'
		it 'is invalid without at least one current feeling'
		it 'is invalid as both an easing_plant and encouraging_plant for the same feeling'
	end





end

