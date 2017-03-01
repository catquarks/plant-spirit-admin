require 'rails_helper'

describe PlantsController, type: :request do 
	before :each do 
		@ringo = User.create(username: "Ringo", password: "octopusgarden")
		visit login_path
		fill_in 'user_username', with: 'Ringo'
		fill_in 'user_password', with: 'octopusgarden'
		click_button 'Login'

		@sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
	end

	feature '#new' do 
		scenario 'user can create a new plant' do 
			visit new_plant_path
			fill_in "plant_name", with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_future_feeling_ids_#{@sadness.id}"
			find_button('Add New Plant').click
			expect(page).to have_content 'New plant added!'
		end

		scenario 'user can assign existing current_feelings to a new plant' do 
			visit '/plants/new'
			fill_in 'plant_name', with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_current_feeling_ids_#{@sadness.id}"
			find_button('Add New Plant').click
			expect(page).to have_content 'New plant added!'
		end

		scenario 'should allow user to assign existing future_feelings to a new plant' do 
			visit '/plants/new'
			fill_in 'plant_name', with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_future_feeling_ids_#{@sadness.id}"
			find_button('Add New Plant').click
			expect(page).to have_content 'New plant added!'			
		end
	end


	feature '#update' do 
		scenario 'should allow user to unassign existing future_feelings from an existing plant' do 
			plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
			plant.future_feelings << @sadness
			plant.save

			visit "/plants/#{plant.id}/edit"
			uncheck "plant_future_feeling_ids_#{@sadness.id}"
			find_button('Edit Plant').click
			expect(page).to have_content 'Successfully updated plant!'
		end

			scenario 'should allow user to unassign existing future_feelings from an existing plant AND add a different future_feeling' do 
			plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
			hope = Feeling.create(name: "Hope", summary: "A hopeful feeling.")
			plant.future_feelings << @sadness
			plant.save

			visit "/plants/#{plant.id}/edit"
			uncheck "plant_future_feeling_ids_#{@sadness.id}"
			check "plant_future_feeling_ids_#{hope.id}"
			find_button('Edit Plant').click
			expect(page).to have_content 'Successfully updated plant!'
		end

		scenario 'should allow user to unassign existing current_feelings from an existing plant' do 
			plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
			plant.current_feelings << @sadness
			plant.save

			visit "/plants/#{plant.id}/edit"
			uncheck "plant_current_feeling_ids_#{@sadness.id}"
			find_button('Edit Plant').click
			expect(page).to have_content 'Successfully updated plant!'
		end

	end




end

