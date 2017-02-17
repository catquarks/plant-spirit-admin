require 'rails_helper'

describe Feeling, type: :model do 

	describe 'Basic attributes' do 
		before(:each) do 
			@feeling = Feeling.create(name: 'Ambivalence', summary: 'Feeling two opposing emotions at the same time.')
		end

		it 'is unique' do 
			duplicate_feeling = Feeling.new(name: 'Ambivalence')
			expect(duplicate_feeling.valid?).to be(false)
		end

		it 'is valid a name' do 
			expect(@feeling.name).to eq('Ambivalence')
		end

		it 'is valid without a summary' do 
			feeling = Feeling.create(name: 'Joy')
			expect(feeling.valid?).to be(true)
		end

	end

	describe 'Invalidations' do 
		it 'cannot have a summary without a name' do 
			invalid_feeling = Feeling.new(summary: 'Feeling two opposing emotions at the same time.')
			expect(invalid_feeling.valid?).to be(false)
		end

	end

	describe 'Relationships with Plants' do 
		before(:each) do 
			@feeling = Feeling.create(name: 'Ambivalence', summary: 'Feeling two opposing emotions at the same time.')
			@lavender = Plant.create(name: 'Lavender')
		end

		it 'should raise error when assigned to plant without easing or encouraging context' do 
			expect {@feeling.plants << @lavender}.to raise_error(NoMethodError)
		end

		it 'cannot be assigned to the same easing_plant twice' do 
			@feeling.easing_plants << @lavender
			expect {@feeling.easing_plants << @lavender}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'cannot be assigned to the same encouraging_plant twice' do 
			@feeling.encouraging_plants << @lavender
			expect {@feeling.encouraging_plants << @lavender}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'is invalid as current_feeling after already being assigned as a future_feeling for the same plant' do 
			@feeling.encouraging_plants << @lavender
			expect {@feeling.easing_plants << @lavender}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'is invalid as future_feeling after already being assigned as a current_feeling for the same plant' do 
			@feeling.easing_plants << @lavender
			expect {@feeling.encouraging_plants << @lavender}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'is valid as a future_feeling for one plant and a current_feeling for a different plant' do 
			new_feeling = Feeling.create(name: 'Sadness')
			@feeling.easing_plants << @lavender
			expect {new_feeling.encouraging_plants << @lavender}.to_not raise_error


		end
		
	end

end

