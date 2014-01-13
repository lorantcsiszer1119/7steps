When /^I have completed step 6$/ do
	step "I change the link to the qa doc"
	
	choose "opening_six_qa_duration_true"
	choose "opening_six_qa_specific_true"
	choose "opening_six_qa_examples_true"
	choose "opening_six_qa_star_method_true"
	choose "opening_six_qa_strenght_true"
	choose "opening_six_qa_weakness_true"
	choose "opening_six_qa_answers_reqs_true"
	choose "opening_six_qa_salary_true"
	click_button "Save changes"

	click_link "Go to Step 7"
end

When /^I change the link to the qa doc$/ do
	fill_in "user_qa_link", with: "http://somelink.com/qa"
	click_button "Save link"
end
Then /^the new qa doc should be that new link$/ do
	user = User.last
	user.qa_link == "http://somelink.com/qa"
end