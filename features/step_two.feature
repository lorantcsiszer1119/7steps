Feature: step 2
	As a person
	I want to complete step 2
	To see step 3

	Scenario: logged in
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		When I have completed step 2
		Then I am on step 3 page
		And I should have step 2 marked as finished

Scenario: guest
		Given I do not exist as a user
		And I have completed step 1 on the step 1 text box
		And I should see the message "Login or Sign Up, don't lose your progress!"
		And I am on step 2 page
		When I have completed step 2
		Then I am on step 3 page
		And I should see the message "Login or Sign Up, don't lose your progress!"
		And I should have step 2 marked as finished

Scenario: registered but not logged in
		Given I am not logged in
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		And I should see the message "Login or Sign Up, don't lose your progress!"
		When I have completed step 2
		Then I am on step 3 page
		And I should have step 2 marked as finished
		And I should see the message "Login or Sign Up, don't lose your progress!"


Scenario Outline: check each item
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		When I choose <item> on the two div
		Then I should have save the modification of <item>
		Examples:
		| item |
		| two_reqs_example |
		| two_reqs_number |
		| two_reqs_completed |

Scenario: check reqs link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		When I am on step 2 page
		Then I click the link Requirements Answers doc

Scenario: change reqs link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		When I change the link to the requirements doc
		Then the new reqs doc should be that new link