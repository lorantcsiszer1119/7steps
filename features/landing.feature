Feature: See the info without logging in
	In order to improve my job hunt
	As a person
	I want to be able to see the whole method

	Scenario: Guest
		Given I am not logged in
		When I go to the landing page
		Then I should see the seven steps

	Scenario: Registered
		Given I exist as a user
		When I go to the landing page
		Then I should see the seven steps

	Scenario: Logged In
		Given I am logged in
		When I go to the landing page
		Then I should see my home page


