Feature: navigation
	As a person
	I want to be able to use the navigation without issues
	So I can use the site

	Scenario Outline: Dashboard, guest
		Given I do not exist as a user
		And I go to the landing page
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		When I click the link <navigation_link>
		Then I should see the message <message>

		Examples:
		| navigation_link | message |
		| 0 | "Openings" |
		| 1 | "Step 1" |
		| 2 | "Step 2" |
		| 3 | "Step 3" |
		| 4 | "Step 4" |
		| 5 | "Step 5" |
		| 5 | "Step 6" |
		| 7 | "Step 7" |

	Scenario Outline: Dashboard, user
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I am on step 2 page
		When I click the link <navigation_link>
		Then I should see the message <message>
				Examples:
		| navigation_link | message |
		| 0 | "Openings" |
		| 1 | "Step 1" |
		| 2 | "Step 2" |
		| 3 | "Step 3" |
		| 4 | "Step 4" |
		| 5 | "Step 5" |
		| 5 | "Step 6" |
		| 7 | "Step 7" |
