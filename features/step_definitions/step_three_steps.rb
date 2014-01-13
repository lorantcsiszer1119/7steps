Given /^I have completed step 3$/ do

	fill_in "user_li_link", with: "http://somelink.com/linkedin"
	fill_in "user_by_link", with: "http://somelink.com/by"
	click_button "Save links"

	within ("#three_li") do
		choose "opening_three_li_photo_true"
		choose "opening_three_li_headline_true" 
		choose "opening_three_li_summary_true" 
		choose "opening_three_li_specialties_true" 
		choose "opening_three_li_work_true" 
		choose "opening_three_li_education_true" 
		choose "opening_three_li_skills_true" 
		choose "opening_three_li_work_others_true" 
		choose "opening_three_li_education_others_true" 
		choose "opening_three_li_skills_others_true" 
		choose "opening_three_li_connections_true" 
		choose "opening_three_li_recommendations_true" 
		choose "opening_three_li_others_true" 
		click_button "Save changes"
	end
	within ("#three_internet") do
		choose "opening_three_google_true" 
		choose "opening_three_by_links_true"
		choose "opening_three_facebook_true"
		choose "opening_three_twitter_true"
		choose "opening_three_social_media_true"
		click_button "Save changes"
	end
	click_link "Go to Step 4"
end