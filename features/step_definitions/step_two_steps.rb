And /^I should have a link to the requirements doc$/ do
	@opening.step_two_link.should_not be_empty
end

When /^I choose (.*) on the (.*) div$/ do |item, div|
	within("#" + "#{div}") do
		choose "opening_#{item}_true"
		click_button "Save changes"
	end
end

Then /^I should have save the modification of (.*)$/ do |item|
	@opening = Opening.last
	@opening.send(item).should == true
end

Given /^I have completed step 2$/ do
	step "I change the link to the requirements doc"
	
	choose "opening_two_reqs_completed_true"
	choose "opening_two_reqs_example_true"
	choose "opening_two_reqs_number_true"
	click_button "Save changes"
	click_link "Go to Step 3"
end
Then /^a new window should pop up with the doc$/ do
	page.driver.browser.window_handles.size == 2
end

When /^I change the link to the requirements doc$/ do
	fill_in "user_q_and_a_link", with: "http://somelink.com/some_offer"
	click_button "Save link"
end

Then /^the new reqs doc should be that new link$/ do
	user = User.last
	user.q_and_a_link == "http://somelink.com/some_offer"
end