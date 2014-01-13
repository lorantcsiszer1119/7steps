Feature: Step 3
	In order to reach Step 4
	As a user
	I want to finish step 3

	Scenario Outline: first time on step 3 check
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		Then I am on step 3 page
		When I choose <item> on the <div> div
		Then I should have save the modification of <item> 

		Examples:
		| item | div |
		| three_li_photo | three_li |
		| three_li_headline | three_li |
		| three_li_summary | three_li |
		| three_li_specialties | three_li |
		| three_li_work | three_li |
		| three_li_education | three_li |
		| three_li_skills | three_li |
		| three_li_work_others | three_li |
		| three_li_education_others | three_li |
		| three_li_skills_others | three_li |
		| three_li_connections | three_li |
		| three_li_recommendations | three_li |
		| three_li_others | three_li |
		| three_google | three_internet |
		| three_by_links | three_internet |
		| three_facebook | three_internet |
		| three_twitter | three_internet |
		| three_social_media | three_internet |

	Scenario: finish step 3
		Given I am logged in
		And I have completed step 1 on the step 1 text box
		And I have completed step 2
		And I am on step 3 page
		When I have completed step 3
		Then I am on step 4 page
		And I should have step 3 marked as finished
		
		
		
		