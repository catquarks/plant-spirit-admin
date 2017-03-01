require 'rails_helper'

describe SessionsController, type: :request do 
	before(:each) do 
		@ringo = User.create(username: "Ringo", password: "octopusgarden")
	end

	feature '#create' do
		scenario 'user should be able to login' do 
			visit login_path
			fill_in 'user_username', with: 'Ringo'
			fill_in 'user_password', with: 'octopusgarden'
			click_button 'Login'
			expect(page).to have_content('Hi, Ringo!')
		end

		scenario 'user should see errors after unsuccessful login attempt' do 
			visit '/login'
			fill_in 'user_username', with: 'Ringo'
			fill_in 'user_password', with: 'wrongpassword'
			click_button 'Login'
			expect(page).to have_content('Oh no! Username or Password is incorrect!')
		end
	end




end



