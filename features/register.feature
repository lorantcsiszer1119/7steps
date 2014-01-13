Feature: Register
	As a guest
	I want to register in the website
	To use the follow up tools available

	Background:
		Given I do not exist as a user

	Scenario: Nothing done yet
		Given I go to the landing page
		When I sign up with valid user data
		Then I should be signed in
		And I should see my home page
		And I should see a successful sign up message
		And I should have a reqs doc and a interviews doc

	Scenario: Step 1 finished
		Given I have completed step 1 on the step 1 text box
		And I should see the message "Login or Sign Up, don't lose your progress!"
		And I am on step 2 page
		When I sign up with valid user data
		Then I should be signed in
		And I should have the job opening I worked on as a guest
		And I should have step 1 marked as finished
		And I should see my home page
		And I should see a successful sign up message
		And I should have a reqs doc and a interviews doc

	Scenario: Step 2 finished
		And I have completed step 1 on the step 1 text box
		And I should see the message "Login or Sign Up, don't lose your progress!"
		And I have completed step 2
		And I should see the message "Login or Sign Up, don't lose your progress!"
		When I sign up with valid user data
		Then I should be signed in
		And I should have the job opening I worked on as a guest
		And I should have step 2 marked as finished
		And I should see my home page
		And I should see a successful sign up message
		And I should have a reqs doc and a interviews doc
		