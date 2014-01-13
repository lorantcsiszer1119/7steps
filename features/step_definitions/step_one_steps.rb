Given /^I have completed step 1 on the landing box$/ do
	@link = "http://www.somejobthing.com/someoffer"
	visit "/"
	within("#desktop-landing-form") do
		fill_in "opening_link", :with => @link
  		click_button "Get started"
	end
end
Given /^I have completed step 1 on the step 1 text box$/ do
	@link = "http://www.somejobthing.com/someoffer"
	visit "/"
	within("#desktop-step1-form") do
		fill_in "opening_link", :with => @link
		fill_in "opening_title", with: "Blood Spatter Analyst"
		fill_in "opening_company", with: "Miami Metro PD"
  		click_button "Get started"
	end
end

And /^I should have the job opening I worked on as a guest$/ do
	@user.openings.count.should == 1
	@opening = @user.openings.first
	@link = @opening.link.should
end

And /^I should see the title and company of the opening$/ do
	page.should have_content "Blood Spatter Analyst"
	page.should have_content "Miami Metro PD"
end

And /^I should have a resume doc and a cover letter doc$/ do
	opening = Opening.last
	opening.four_cv_link.should_not be_nil
	opening.five_cl_link.should_not be_nil
end


And /^I should have step (.*) marked as finished$/ do |step|
	@opening = Opening.last
	case step
	when "1"
		@opening.step_one_finished.should == true
	when "2"
		@opening.step_two_finished.should == true
	when "3"
		@opening.step_three_finished.should == true
	when '4'
		@opening.step_four_finished.should == true
	when '5'
		@opening.step_five_finished.should == true
	when '6'
		@opening.step_six_finished.should == true
	when '7'
		@opening.step_seven_finished.should == true
	else
		true == false
	end
end

And /^I go to the login page$/ do
	click_button 'Login'
end
