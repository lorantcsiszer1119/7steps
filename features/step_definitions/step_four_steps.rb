When /^I have completed step 4$/ do
	step "I change the link to the cv doc"

	

	choose "opening_four_cv_format_true"
	choose "opening_four_cv_basic_true"
	choose "opening_four_cv_linkedin_true"
	choose "opening_four_cv_headline_true"
	choose "opening_four_cv_qualifications_true"
	choose "opening_four_cv_work_true"
	choose "opening_four_cv_education_true"
	choose "opening_four_cv_skills_true"
	choose "opening_four_cv_work_others_true"
	choose "opening_four_cv_education_others_true"
	choose "opening_four_cv_skills_others_true"
	click_button "Save changes"

	click_link "Go to Step 5"
end


Then /^I should have the link saved on the database$/ do
	opening = Opening.last
	opening.cv_link.should_not be_empty
end

And /^I change the link to the cv doc$/ do
	fill_in "opening_four_cv_link", with: "http://somelink.com/cv"
	click_button "Save link"
end

Then /^the new cv doc should be that new link$/ do
	opening = Opening.last
	opening.five_cl_link == "http://somelink.com/cv"
end