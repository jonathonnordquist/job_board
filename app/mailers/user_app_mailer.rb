class UserAppMailer < ApplicationMailer

  def apply_email(app)
    @app = app
    job = Job.find(app[:job_id])
    user = User.find(job[:user_id])
    mail to: user.email, subject: "Welcome"
  end
end
