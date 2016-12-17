module LoginHelper
	def fill_in_signin_fields
		fill_in "user[email]", with: "1@email.com"
		fill_in "user[password]", with: "password"
		click_button "Log in"
	end

	def fill_in_tournament_info
		fill_in "tournament[name]", with: "My Tournament"
		fill_in "tournament[description]", with: "The best tournament ever!"
		choose "tournament[ispublic]", :option => "1"

		#select "option[2]", from: "tournament[golf_course_id]"
		find('#tournament_golf_course_id').find(:xpath, 'option[5]').select_option

		find('#tournament_date_1i').find(:xpath, 'option[1]').select_option
		find('#tournament_date_2i').find(:xpath, 'option[3]').select_option
		find('#tournament_date_3i').find(:xpath, 'option[20]').select_option
		find('#tournament_date_4i').find(:xpath, 'option[1]').select_option
		find('#tournament_date_5i').find(:xpath, 'option[50]').select_option

		attach_file("tournament[image]", "spec/test_tournament_image.jpeg")

		fill_in "tournament[extrafeatures]", with: "Free lunch!"

		click_button "Create Tournament"
	end

	def fill_in_signup_user_fields
		fill_in "user[email]", with: "newacct@email.com"
		fill_in "user[password]", with: "password"
		fill_in "user[password_confirmation]", with: "password"
		click_button "Sign up"
	end

	def fill_in_signup_person_fields
		fill_in "person[firstname]", with: "TestFirstName"
		fill_in "person[lastname]", with: "TestLastName"
		find('#person_dob_2i').find(:xpath, 'option[2]').select_option
		find('#person_dob_3i').find(:xpath, 'option[28]').select_option
		find('#person_dob_1i').find(:xpath, 'option[30]').select_option
		fill_in "person[phone]", with: "123-456-7890"
		fill_in "person[address_attributes][apartmentNumber]", with: "123"
		fill_in "person[address_attributes][streetNumber]", with: "6"
		fill_in "person[address_attributes][streetName]", with: "TestStreet"
		fill_in "person[address_attributes][city]", with: "Toronto"
		fill_in "person[address_attributes][province]", with: "Ontario"
		fill_in "person[address_attributes][country]", with: "Canada"
		fill_in "person[address_attributes][postalCode]", with: "M1C E4F"
		click_button "Save"
	end

	def fill_in_golfcourse_info
		fill_in "golf_course[name]", with: "My golf_course"
		fill_in "golf_course[description]", with: "The best golf_course ever!"
		fill_in "golf_course[address_attributes][streetNumber]", with: "123"
		fill_in "golf_course[address_attributes][streetName]", with: "golfstreet"
		fill_in "golf_course[address_attributes][city]", with: "golfcity"
		fill_in "golf_course[address_attributes][province]", with: "golfprovince"
		fill_in "golf_course[address_attributes][country]", with: "golfcountry"
		fill_in "golf_course[address_attributes][postalCode]", with: "G1P 4O2"

		attach_file("golf_course[image]", "spec/test_golfcourse_image.jpg")

		click_button "Create Golf course"
	end
end