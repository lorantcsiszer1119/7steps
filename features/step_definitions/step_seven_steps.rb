When /^I have completed step 7$/ do
  
	choose "opening_seven_essentials_true"
	choose "opening_seven_cl_and_cv_true"
  click_button "Save changes"

  fill_in "opening_seven_recruiter_name", :with => "John"
  fill_in "opening_seven_recruiter_background", :with => "Loser"
  fill_in "opening_seven_q_one", :with => "question ?"
  fill_in "opening_seven_q_two", :with => "question 2?"
  fill_in "opening_seven_q_three", :with => "question 3?"
  click_button "Save answers"

  fill_in "opening_seven_next_step", :with => "2013-02-02"
  click_button "Save date"
  	
end

Then /^I should have (.*) saved on the database for (.*)$/ do |text, field|
  opening = Opening.last
  opening.send(field).should == text
end


When /^I type (.*) on (.*)$/ do |text, field |
  fill_in "opening_#{field}", with: text
end

And /^I click the link (.*)$/ do |link|
  click_link link
end

And /^I click the button (.*)$/ do |button|
  click_button button
end