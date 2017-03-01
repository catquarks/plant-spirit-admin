require 'rails_helper'

describe UsersController, type: :controller do 
	before :each do 
		@rose = Plant.create(name: "Rose", summary: "A plant that looks and smells like a rose.")
		@sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
	end

	context 'Plants' do 
		feature '#index' do
			scenario 'unlogged-in users should be unable to view plants index' do 
				visit plants_path
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end

		feature '#show' do 
			scenario 'unlogged-in users should be unable to view plant show pages' do 
				visit plant_path(@rose)
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end
		
		feature '#edit' do 
			scenario 'unlogged-in users should be unable to edit plants' do 
				visit edit_plant_path(@rose)
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end
	end

	context 'Feelings' do
		feature '#index' do 
			scenario 'unlogged-in users should be unable to see feelings index' do 
				visit feelings_path
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end

		feature '#show' do 
			scenario 'unlogged-in users should be unable to see feeling show pages' do 
				visit feeling_path(@sadness)
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end

		feature '#edit' do 
			scenario 'unlogged-in users should be unable to edit a feeling' do 
				visit feeling_path(@sadness)
				expect(page).to have_content 'You must be logged in to do this!'
			end
		end

	end

end