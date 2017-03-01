require 'rails_helper'

describe Plant, type: :model do 
	describe 'Basic attributes' do 
		before(:each) do 
			@plant = Plant.create(name: 'Rose', summary: 'A flower that looks and smells like a rose.')
		end

		it 'has a unique name' do
			duplicate_plant = Plant.new(name: 'Rose')
			expect(duplicate_plant.valid?).to be(false)
		end

		it 'has a name' do 
			expect(@plant.name).to eq('Rose')
		end

		it 'is valid without a summary' do 
			plant = Plant.create(name: 'Fern')
			expect(plant.valid?).to be(true)
		end

		it 'can be assigned to a future_feeling' do 
			feeling = Feeling.create(name: 'Ambivalence', summary: 'Feeling two opposing emotions at the same time.')
			@plant.future_feelings << feeling 
			@plant.save
			expect(@plant.future_feelings).to include(feeling)
		end
		it 'can be assigned to a current_feeling' do 
			feeling = Feeling.create(name: 'Ambivalence', summary: 'Feeling two opposing emotions at the same time.')
			@plant.current_feelings << feeling 
			@plant.save
			expect(@plant.current_feelings).to include(feeling)
		end

	end

	describe 'Invalidations' do 
		before(:each) do 
			@plant = Plant.create(name: 'Rose', summary: 'A flower that looks and smells like a rose.')
		end
		
		it 'is invalid without a name' do 
			plant = Plant.new(summary: 'Flora')
			expect(plant.valid?).to be(false)
		end

		it 'is invalid as both an easing_plant and encouraging_plant for the same feeling' do
			feeling = Feeling.create(name: 'Ambivalence', summary: 'Feeling two opposing emotions at the same time.')
			@plant.current_feelings << feeling 
			@plant.save

			expect {@plant.future_feelings << feeling}.to raise_error(ActiveRecord::RecordInvalid)
		end

	end

end

