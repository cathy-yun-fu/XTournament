require 'rails_helper'

feature "signup" do
	
	scenario "visiting the site to sign up" do
		visit root_path
		expect(page).to have_link("Sign Up", visible: false)
		find('a', :text => "Sign Up", visible: false).click
		
		save_and_open_page

		fill_in_signup_user_fields		
		fill_in_signup_person_fields
			
		save_and_open_page
		
		expect(page).to have_current_path(people_profile_path, only_path: true)
		
		expect(page).to have_content("Profile")
	end
end
