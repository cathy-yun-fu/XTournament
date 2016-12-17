require 'rails_helper'

feature "create_tournament" do
	
	scenario "creating a tournament" do
		visit "/tournaments/new"
		#should not be able to access tournaments/new without logging in
		expect(page).to have_text("Log in") 
		fill_in_signin_fields
		
		expect(page).to have_text("Create a Tournament")
		fill_in_tournament_info

		expect(page).to have_current_path(/\/tickets\/\d+/)
		expect(page).to have_text("Transaction Successful")
		click_link "Continue to tournament"
		
		save_and_open_page
		
		expect(page).to have_current_path(/\/tournaments\/\d+/)
		expect(page).to have_text("My Tournament")
	end

end