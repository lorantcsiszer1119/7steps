class UserMailer < ActionMailer::Base
  default from: "\"Anto, from 7 steps to the job you want\" <anto@7stepstothejobyouwant.com>"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to 7 steps to the job you want.")
  end

  def notify_anto(user)
  	@user = user
  	mail(to: "anto@7stepstothejobyouwant.com", subject: "new member: #{@user.email}")
  end

end
