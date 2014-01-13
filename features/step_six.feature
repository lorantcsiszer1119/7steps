Feature: step 6
	As a user
	I want to to complete step 6
	to move on to step 7

	Scenario Outline: check each item
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I am on step 6 page
		When I choose <item> on the six div
		Then I should have save the modification of <item> 

		Examples:
		| item |
		| six_qa_duration |
		| six_qa_specific |
		| six_qa_examples |
		| six_qa_star_method |
		| six_qa_answers_reqs |
		| six_qa_strenght |
		| six_qa_weakness |
		| six_qa_salary |

	Scenario: finish step 6
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I am on step 6 page
		When I have completed step 6
		Then I am on step 7 page
		And I should have step 6 marked as finished

	Scenario: check qa link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		When I am on step 6 page
		Then I click the link Interview Q&A doc

	Scenario: change qa link
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I am on step 6 page
		When I change the link to the qa doc
		Then the new qa doc should be that new link