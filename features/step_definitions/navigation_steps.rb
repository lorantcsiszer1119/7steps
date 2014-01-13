Then /^I stay on the same home page$/ do
	page.should have_content "7 steps to the job you want"
end

When /^I click the nav link (.*)$/ do |nav|
	page.find_by_id(nav).click
end

