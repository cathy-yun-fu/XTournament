require 'rails_helper'

feature "create_golfcourse" do
	
	scenario "creating a golfcourse" do
		visit "/golf_courses/new"
		#should not be able to access golf_courses/new without logging in
		expect(page).to have_text("Log in") 
		fill_in_signin_fields
		
		expect(page).to have_text("Register a new golf course")
		fill_in_golfcourse_info

		save_and_open_page
		
		expect(page).to have_text("You are an organizer for this golf course!")

	end

end