require 'rails_helper'

describe PlantsController, type: :controller do 

	feature '#create' do 
		before :each do 
			@sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
			@hope = Feeling.create(name: "Hope", summary: "A hopeful feeling.")
		end

		scenario 'user can assign existing current_feelings to a new plant' do 
			visit new_plant_path

			fill_in 'plant_name', with: "Eucalyptus"
			fill_in 'plant_summary', with: "A very nice smelling plant."
			check "plant_future_feeling_ids_#{@sadness.id}"
			click_button 'submit'

			expect(page).to have_content 'New plant created!'

		end

		scenario 'should allow user to assign existing future_feelings to a new plant'
	end


	feature '#update' do 
		scenario 'should allow user to unassign existing future_feelings from an existing plant'

	end

	it 'should not allow non-admin users to delete'
	it 'unlogged in users should be unable to see edit or delete options'


end

