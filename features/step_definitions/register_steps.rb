And /^I am on step (.*) page$/ do |step|
	page.should have_content "Step #{step}"
end

And /^I should see the message "(.*)"$/ do |message|
	page.should have_content message
end

And /^I should have a reqs doc and a interviews doc$/ do
	user = User.last
	user.qa_link.should_not be_empty
	user.q_and_a_link.should_not be_empty
end
