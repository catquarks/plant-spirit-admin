require 'rails_helper'

describe FeelingsController, type: :request do 
	before :each do 
		@ringo = User.create(username: "Ringo", password: "octopusgarden")
		visit login_path
		fill_in 'user_username', with: 'Ringo'
		fill_in 'user_password', with: 'octopusgarden'
		click_button 'Login'
		@sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
		@rose = Plant.create(name: "Rose", summary: "A nice smelling plant.")
		@eucalyptus = Plant.create(name: "Eucalyptus", summary: "A plant that koalas eat.")
	end

	feature '#new' do 
		scenario 'user can create a new feeling' do 
			visit new_feeling_path
			fill_in "feeling_name", with: "Sadness"
			fill_in 'feeling_summary', with: "A sad feeling."
			find_button('Add New Feeling').click
			expect(page).to have_content 'New feeling added!'
		end

		scenario 'user can assign existing easing_plants to a new feeling' do 
			visit '/feelings/new'
			fill_in 'feeling_name', with: "Sadness"
			fill_in 'feeling_summary', with: "A sad feeling."
			check "feeling_easing_plant_ids_#{@rose.id}"
			find_button('Add New Feeling').click
			expect(page).to have_content 'New feeling added!'
		end

		scenario 'should allow user to assign existing encouraging_plants to a new feeling' do 
			visit '/feelings/new'
			fill_in 'feeling_name', with: "Sadness"
			fill_in 'feeling_summary', with: "A sad feeling."
			check "feeling_encouraging_plant_ids_#{@rose.id}"
			find_button('Add New Feeling').click
			expect(page).to have_content 'New feeling added!'			
		end
	end


	feature '#update' do 
		scenario 'should allow user to unassign existing easing_plants from an existing feeling' do 
			plant = Plant.create(name: "Rose", summary: "A very nice smelling plant.")
			plant.future_feelings << @sadness
			plant.save

			visit "/feelings/#{@sadness.id}/edit"
			uncheck "feeling_encouraging_plant_ids_#{@rose.id}"
			find_button('Edit Feeling').click
			expect(page).to have_content 'Successfully updated feeling!'
		end

		scenario 'should allow user to unassign existing future_feelings from an existing plant AND add a different future_feeling' do
			sadness = Feeling.create(name: "Sadness", summary: "A sad feeling.")
			plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
			hope = Feeling.create(name: "Hope", summary: "A hopeful feeling.")
			plant.future_feelings << sadness
			plant.save

			visit "/plants/#{plant.id}/edit"
			uncheck "plant_future_feeling_ids_#{@sadness.id}"
			check "plant_future_feeling_ids_#{hope.id}"
			find_button('Edit Plant').click
			expect(page).to have_content 'Successfully updated plant!'
		end

		# scenario 'should allow user to unassign existing current_feelings from an existing plant' do 
		# 	plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
		# 	plant.current_feelings << @sadness
		# 	plant.save

		# 	visit "/plants/#{plant.id}/edit"
		# 	uncheck "plant_current_feeling_ids_#{@sadness.id}"
		# 	find_button('Edit Plant').click
		# 	expect(page).to have_content 'Successfully updated plant!'
		# end

		# scenario 'should allow user to unassign existing current_feelings from an existing plant AND add a different current_feeling' do 
		# 	plant = Plant.create(name: "Eucalyptus", summary: "A very nice smelling plant.")
		# 	hope = Feeling.create(name: "Hope", summary: "A hopeful feeling.")
		# 	plant.current_feelings << @sadness
		# 	plant.save

		# 	visit "/plants/#{plant.id}/edit"
		# 	uncheck "plant_current_feeling_ids_#{@sadness.id}"
		# 	check "plant_current_feeling_ids_#{hope.id}"
		# 	find_button('Edit Plant').click
		# 	expect(page).to have_content 'Successfully updated plant!'
		# end

	end

end

