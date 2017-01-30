require 'rails_helper'

describe Flower, type: :model do 
	describe 'Basic attributes' do 
		it 'is unique'

		it 'has a name' do 
			flower = Flower.create(name: 'Flora')
			expect(flower.name).to eq('Flora')
		end

		it 'has a summary'
		it 'has at least one future feeling'
		it 'has at least one current feeling'

		it 'can only be assigned to future or current feelings'
	end

	describe 'Invalidations' do 
		
		it 'is invalid without a name' do 
			flower = Flower.new(summary: 'Flora')
			expect(flower.valid?).to be(false)
		end

		it 'is invalid without a summary'
		it 'is invalid without at least one future feeling'
		it 'is invalid without at least one current feeling'
		it 'is invalid as both an easing and encouraging flower for the same feeling'
	end





end

