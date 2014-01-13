class Opening < ActiveRecord::Base
	include Driveable
	belongs_to :user
	
	
	def generate_opening_drive_templates_test
		self.four_cv_link = "http://www.google.com"
		self.five_cl_link = "http://www.google.com"
		save!
	end

	def unfinished_step
		if !step_one_finished 
			return 1
		elsif !step_two_finished 
			return 2
		elsif !step_three_finished 
			return 3
		elsif !step_four_finished 
			return 4
		elsif !step_five_finished 
			return 5
		elsif !step_six_finished 
			return 6
		elsif !step_seven_finished
			return 7
		end
	end

	def check_step_one
		self.step_one_finished = [link, title, company].all?
		if changed? && step_one_finished
			save!
			Rails.env.test? ? generate_opening_drive_templates_test : generate_opening_drive_templates
			save!
		end
	end

	def check_step_two
		self.step_two_finished = [ user.q_and_a_link, two_reqs_example, \
			two_reqs_number, two_reqs_completed].all?
		save! if changed?
	end

	def check_step_three
		self.step_three_finished = [user.li_link, user.by_link, three_li_photo, three_li_headline, \
			three_li_summary, three_li_specialties, three_li_work, three_li_education, \
			three_li_skills, three_li_work_others, three_li_education_others, \
			three_li_skills_others, three_li_connections, three_li_recommendations, \
			three_li_others, three_google, three_by_links, three_facebook, three_twitter, three_social_media].all?
		save! if changed?
	end

	def check_step_four
		self.step_four_finished = [ four_cv_link, four_cv_format, four_cv_basic, four_cv_linkedin, \
			four_cv_headline, four_cv_qualifications, four_cv_work, four_cv_education, \
			four_cv_skills, four_cv_work_others, four_cv_education_others, four_cv_skills_others].all?
		save! if changed?
	end

	def check_step_five
		self.step_five_finished = [five_cl_link, five_cl_recruiter_name, five_cl_intro, five_cl_skills, \
			five_cl_company_positives, five_cl_availability ].all?
		save! if changed?
	end

	def check_step_six
		self.step_six_finished = [user.qa_link, six_qa_duration, six_qa_specific, six_qa_examples, \
			six_qa_star_method, six_qa_answers_reqs, six_qa_strenght, six_qa_weakness, six_qa_salary].all?
		save! if changed?
	end

	def check_step_seven
		self.step_seven_finished = [ seven_recruiter_name, seven_recruiter_background, seven_q_one, \
			seven_q_two, seven_q_three, seven_next_step, seven_essentials, seven_cl_and_cv ].all?
		save! if changed?
	end

	def generate_opening_drive_templates

		client = Google::APIClient.new
		client.authorization.client_id = CLIENT_ID
		client.authorization.client_secret = CLIENT_SECRET
		client.authorization.grant_type = 'refresh_token'
		client.authorization.refresh_token = REFRESH_TOKEN

  		client.authorization.fetch_access_token!
  		client.authorization
  		
  		cv_file_name = self.title + "_at_" + self.company + "_cv_" + self.user.email
  		data = self.copy_file(client, CV_TEMPLATE_FILEID, cv_file_name, four_cv_link)
  		cv_fileId= data.id
  		data = self.insert_permission(client, cv_fileId, self.user.email, "anyone", "writer")
  		
  		cl_file_name = self.title + "_at_" + self.company + "_cl_" + self.user.email
  		data = self.copy_file(client, CL_TEMPLATE_FILEID, cl_file_name, four_cv_link)
  		cl_fileId= data.id
  		data = self.insert_permission(client, cl_fileId, self.user.email, "anyone", "writer")
  		
  		session = GoogleDrive.login_with_oauth(client.authorization.access_token)
  		
  		file = session.file_by_title(cv_file_name)
  		self.four_cv_link = file.human_url
  		
  		file = session.file_by_title(cl_file_name)
  		self.five_cl_link = file.human_url
		
		self.save!
	end
	#handle_asynchronously :generate_opening_drive_templates if !Rails.env.test?

	def step_one_points
		points = 0
		points+=50 if !link.blank?
		points+=25 if !title.blank?
		points+=25 if !company.blank?
		points
	end

	def step_two_points
		points = 0
		points+=40 if two_reqs_completed
		points+=30 if two_reqs_example
		points+=30 if two_reqs_number
		points
	end
	def step_three_points
		points = 0
		points+=10 if !user.li_link.blank?
		points+=7 if !user.by_link.blank?
		points+=4 if three_li_photo
		points+=4 if three_li_headline
		points+=4 if three_li_summary
		points+=4 if three_li_specialties
		points+=4 if three_li_work
		points+=4 if three_li_education
		points+=4 if three_li_skills
		points+=2 if three_li_work_others
		points+=2 if three_li_education_others
		points+=2 if three_li_skills_others
		points+=6 if three_li_connections
		points+=5 if three_li_recommendations
		points+=2 if three_li_others
		points+=10 if three_google
		points+=5 if three_by_links
		points+=10 if three_facebook
		points+=5 if three_twitter
		points+=6 if three_social_media
		points
	end
	def step_four_points
		points = 0
		points+=15 if four_cv_format
		points+=10 if four_cv_basic
		points+=5 if four_cv_linkedin
		points+=10 if four_cv_headline
		points+=15 if four_cv_qualifications
		points+=10 if four_cv_work
		points+=10 if four_cv_education
		points+=10 if four_cv_skills
		points+=5 if four_cv_work_others
		points+=5 if four_cv_education_others
		points+=5 if four_cv_skills_others
		points
	end
	def step_five_points
		points = 0
		points+=15 if five_cl_recruiter_name
		points+=20 if five_cl_intro
		points+=25 if five_cl_skills
		points+=25 if five_cl_company_positives
		points+=15 if five_cl_availability
		points
	end
	def step_six_points
		points = 0
		points+=10 if six_qa_duration
		points+=15 if six_qa_specific
		points+=15 if six_qa_examples
		points+=15 if six_qa_star_method
		points+=15 if six_qa_answers_reqs
		points+=10 if six_qa_strenght
		points+=10 if six_qa_weakness
		points+=10 if six_qa_salary
		points
	end
	def step_seven_points
		points = 0
		points+=10 if seven_recruiter_name
		points+=10 if seven_recruiter_background
		points+=15 if seven_q_one
		points+=15 if seven_q_two
		points+=15 if seven_q_three
		points+=15 if seven_next_step
		points+=10 if seven_essentials
		points+=10 if seven_cl_and_cv
		points
	end

	def total_points
		step_seven_points + step_six_points + step_five_points + step_four_points + step_three_points + step_two_points + step_one_points
	end

end
