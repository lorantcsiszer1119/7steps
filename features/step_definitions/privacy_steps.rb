When /^I type the url to that job opening$/ do
	visit "/openings/#{@opening.id}"
end

And /^there is a user with a job opening$/ do
	@opening = FactoryGirl.create(:opening)
end

When /^I type the url to an unexistent job opening$/ do
	visit "/openings/6785765"
end

