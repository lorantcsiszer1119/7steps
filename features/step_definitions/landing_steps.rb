When /^I go to the landing page$/ do
	visit "/"
end

When /^I go to my dashboard$/ do
	visit "/"
end

Then /^I should see the seven steps$/ do
	for i in 1..7
		page.should have_content("Step #{i}")
	end
end

Then /^I should see my home page$/ do
	page.should have_content("#{@user.email}")	
	page.should have_content('Openings')	
end

And /^I click on the button "(.*)"$/ do |button|
	click_button button
end

Then /^I am at the landing page$/ do
	page.should have_content "7 steps to the job you want."	
end