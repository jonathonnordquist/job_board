# Preview all emails at http://localhost:3000/rails/mailers/user_app_mailer
class UserAppMailerPreview < ActionMailer::Preview
  def apply_email
    current_user = User.first
    
    desc = "descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc
    descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc
    descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc"
    job = Job.create(title: "title", company: "company", description: desc,
                  category: "part-time", user_id: current_user.id)
    
    app = { application_text: "An application", job_id: job.id }
    UserAppMailer.apply_email(app, current_user)
  end
end
