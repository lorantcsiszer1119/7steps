When /^I have completed step 5$/ do
	step "I change the link to the cover letter"

	choose "opening_five_cl_recruiter_name_true"
	choose "opening_five_cl_intro_true"
	choose "opening_five_cl_skills_true"
	choose "opening_five_cl_company_positives_true"
	choose "opening_five_cl_availability_true"
	click_button "Save changes"

	click_link "Go to Step 6"
end

And /^I change the link to the cover letter$/ do
	fill_in "opening_five_cl_link", with: "http://somelink.com/cl"
	click_button "Save link"
end

Then /^the new cover letter doc should be that new link$/ do
	opening = Opening.last
	opening.five_cl_link == "http://somelink.com/cl"
end
