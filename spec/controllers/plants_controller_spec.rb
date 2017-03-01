require 'rails_helper'

describe PlantsController, type: :controller do 
	before :each do 
		@ringo = User.create(username: "Ringo", password: "octopusgarden")
		visit login_path
		fill_in 'user_username', with: 'Ringo'
		fill_in 'user_password', with: 'octopusgarden'
		click_button 'Login'

		@sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
		@hope = Feeling.create(name: "Hope", summary: "A hopeful feeling.")
	end

	feature '#new' do 
		scenario 'user can create a new plant' do 
			visit '/plants/new'
			fill_in 'plant_name', with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_future_feeling_ids_#{@sadness.id}"
			click_button 'submit'
			expect(page).to have_content 'New plant created!'
		end

		scenario 'user can assign existing current_feelings to a new plant' do 
			visit '/plants/new'
			fill_in 'plant_name', with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_current_feeling_ids_#{@sadness.id}"
			click_button 'submit'
			expect(page).to have_content 'New plant created!'
		end

		scenario 'should allow user to assign existing future_feelings to a new plant'
	end


	feature '#update' do 
		scenario 'should allow user to unassign existing future_feelings from an existing plant'

	end




end

