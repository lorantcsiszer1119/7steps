class User < ActiveRecord::Base
	include Driveable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :generate_user_drive_templates_wrapper, :unless => Proc.new{ Rails.env.test? }
  after_create :generate_user_drive_templates_test, :unless => Proc.new{ !Rails.env.test? }


  has_many :openings
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Invalid email, please try again"


	def generate_user_drive_templates_test
		self.qa_link = "http://www.google.com"
		self.q_and_a_link = "http://www.google.com"
		save!
	end

	#had to create this method because devise would not play along with delayed job
	def generate_user_drive_templates_wrapper
		self.delay.generate_user_drive_templates
	end

	def generate_user_drive_templates

		client = Google::APIClient.new
		client.authorization.client_id = CLIENT_ID
		client.authorization.client_secret = CLIENT_SECRET
		client.authorization.grant_type = 'refresh_token'
		client.authorization.refresh_token = REFRESH_TOKEN

		client.authorization.fetch_access_token!
		client.authorization
		
		qa_file_name = self.email + "_qa"
		data = self.copy_file(client, QA_TEMPLATE_FILEID, qa_file_name, qa_link)
		qa_fileId= data.id
		data = self.insert_permission(client, qa_fileId, self.email, "anyone", "writer")
		
		q_and_a_file_name = self.email + "_q_and_a"
		data = self.copy_file(client, Q_AND_A_TEMPLATE_FILEID, q_and_a_file_name, q_and_a_link)
		q_and_a_fileId= data.id
		data = self.insert_permission(client, q_and_a_fileId, self.email, "anyone", "writer")
		
		session = GoogleDrive.login_with_oauth(client.authorization.access_token)
		
		file = session.file_by_title(qa_file_name)
		self.qa_link = file.human_url
		
		file = session.file_by_title(q_and_a_file_name)
		self.q_and_a_link = file.human_url
		
		self.save!
	end

end
