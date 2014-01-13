Feature: step 4
	As a user
	I want to use step 4
	to move on to step 5


	Scenario Outline: check each item
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I am on step 4 page
		When I choose <item> on the four div
		Then I should have save the modification of <item> 

		Examples:
		| item |
		| four_cv_format |
		| four_cv_basic |
		| four_cv_linkedin |
		| four_cv_headline |
		| four_cv_qualifications |
		| four_cv_work |
		| four_cv_education |
		| four_cv_skills |
		| four_cv_work_others |
		| four_cv_education_others |
		| four_cv_skills_others |


	Scenario: finish step 4
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I am on step 4 page
		When I have completed step 4
		Then I am on step 5 page
		And I should have step 4 marked as finished

Scenario: check cv link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		When I am on step 4 page
		Then I click the link Resume for this opening

Scenario: change cv link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I am on step 4 page
		When I change the link to the cv doc
		Then the new cv doc should be that new link