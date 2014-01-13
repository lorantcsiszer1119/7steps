Feature: check dashboard
	As a user
	I want to see the dashboard
	To have a global look of my applying process

	Background:
		Given I am logged in

	Scenario: no job openings
		When I go to my dashboard
		Then I should see the message "Your job openings will show up here."

	Scenario: step 1 finished 
		And I have completed step 1 on the step 1 text box
		When I go to my dashboard
		Then I should see the message "Job Openings."
		And I should see the title and company of the opening
		And I should see 100 points on step one
		Then I click on the opening name
		And I am on step 2 page

	Scenario: step 2 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		When I go to my dashboard
		And I should see 100 points on step two
		And I click on the opening name
		And I am on step 3 page

	Scenario: step 3 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3
		When I go to my dashboard
		Then I should see the message "LinkedIn profile"
		And I should see the message "brandyourself profile"
		And I should see 100 points on step three
		And I click on the opening name
		And I am on step 4 page

	Scenario: step 4 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3
		And I have completed step 4
		When I go to my dashboard
		And I should see 100 points on step four
		Then I click on the opening name
		And I am on step 5 page

	Scenario: step 5 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3
		And I have completed step 4
		And I have completed step 5
		When I go to my dashboard
		And I should see 100 points on step five
		Then I click on the opening name
		And I am on step 6 page

	Scenario: step 6 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		When I go to my dashboard
		And I should see 100 points on step six
		Then I click on the opening name
		And I am on step 7 page

	Scenario: step 7 finished
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I have completed step 7
		When I go to my dashboard
		And I should see 100 points on step seven

	Scenario: one opening half filled
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		When I go to the landing page
		Then I should see 100 points on step one
		Then I should see 100 points on step two
		Then I should see 100 points on step three
		And I should see 300 points for all

	Scenario: one opening totally filled
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I have completed step 7
		When I go to the landing page
		Then I should see 100 points on step one
		Then I should see 100 points on step two
		Then I should see 100 points on step three
		Then I should see 100 points on step four
		Then I should see 100 points on step five
		Then I should see 100 points on step six
		Then I should see 100 points on step seven
		And I should see 700 points for all