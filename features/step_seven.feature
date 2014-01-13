Feature: Step 7
	As a user
	I want to finish step 7
	So I can rock the interview

	Scenario Outline: texts
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I am on step 7 page
		When I type <text> on <field>
		And I click the button Save answers
		Then I should have <text> saved on the database for <field>

		Examples:
		| text | field |
		| John Doe | seven_recruiter_name |
		| Is a loser | seven_recruiter_background |
		| Do you want me ? | seven_q_one |
		| Really? | seven_q_two |
		| seriously? | seven_q_three |

	Scenario Outline: check each item before
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I am on step 7 page
		When I choose <item> on the seven div
		Then I should have save the modification of <item> 

		Examples:
		| item |
		| seven_essentials |
		| seven_cl_and_cv |

	Scenario: finish step 7 positive
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I have completed step 7
		When I click the link I got it!
		Then I should see the message "Have some marching cats!"

	Scenario: finish step 7 negative
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I have completed step 3 
		And I have completed step 4
		And I have completed step 5
		And I have completed step 6
		And I have completed step 7
		When I click the link Didn't get it
		And I should see the message "You will not believe who got rejected before you."
		Then I click the link Find a new job opening
		And I should see my home page
