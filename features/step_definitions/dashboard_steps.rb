When /^I should see 100 points on step (.*)$/ do |step|
	within "#1-#{step}" do
		page.should have_content "100"
	end
end

Then /^I click on the opening name$/ do
	click_link "Blood Spatter Analyst at Miami Metro PD"
end

And /^I should see (.*) points for all$/ do |points|
	page.should have_content "#{points}/700"
end
