Feature: ensure privacy
	As a user
	I should only see my own openings
	To ensure user privacy
 
	Scenario: guest existent opening
		Given I do not exist as a user
		And there is a user with a job opening
		When I type the url to that job opening
		Then I am at the landing page
		And I should see the message "Please log in to see your progress"
	
	Scenario: guest inexistent opening
		Given I do not exist as a user
		And there is a user with a job opening
		When I type the url to an unexistent job opening
		Then I am at the landing page
		And I should see the message "Please log in to see your progress"

	Scenario: other user
		Given I am logged in
		And there is a user with a job opening
		When I type the url to that job opening
		Then I should see my home page
