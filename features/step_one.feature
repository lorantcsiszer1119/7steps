Feature: Step one
	As a person
	I want to complete step one
	To see step 2

	Scenario: landing text box guest
		Given I do not exist as a user
		And I go to the landing page
		When I have completed step 1 on the landing box
		Then I am on step 1 page
		And I should see the message "Login or Sign Up, don't lose your progress!"

	Scenario: step 1 text box guest
		Given I do not exist as a user
		And I go to the landing page
		When I have completed step 1 on the step 1 text box
		Then I am on step 2 page
		And I should see the message "Login or Sign Up, don't lose your progress!"
		And I should have a resume doc and a cover letter doc
		
	Scenario: landing text box not logged in
		Given I exist as a user
		And I go to the landing page
		When I have completed step 1 on the landing box
		Then I am on step 1 page
		And I should see the message "Login or Sign Up, don't lose your progress!"

	Scenario: logged in user
		Given I am logged in
		When I have completed step 1 on the step 1 text box
		Then I am on step 2 page
		And I should have a resume doc and a cover letter doc


		