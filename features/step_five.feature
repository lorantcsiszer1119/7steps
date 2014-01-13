Feature: step 5
	As a user
	I wanto to complete step 5
	to move on to step 6

	Scenario Outline: check each item
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I am on step 5 page
		When I choose <item> on the five div
		Then I should have save the modification of <item> 

		Examples:
		| item |
		| five_cl_recruiter_name |
		| five_cl_intro |
		| five_cl_skills |
		| five_cl_company_positives |
		| five_cl_availability |

	Scenario: finish step 5
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I am on step 5 page
		When I have completed step 5
		Then I am on step 6 page
		And I should have step 5 marked as finished

	Scenario: check cl link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		Then I am on step 5 page
		Then I click the link Cover letter for this opening

Scenario: change cl link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I am on step 5 page
		When I change the link to the cover letter
		Then the new cover letter doc should be that new link