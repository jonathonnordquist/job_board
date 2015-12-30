require "rails_helper"

RSpec.describe UserAppMailer, type: :mailer do
  it 'sends mail' do
    user = FactoryGirl.build(:user)
    user.save
    
    desc = "descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc
    descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc
    descdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdescdesc"
    job = Job.create(title: "title", company: "company", description: desc,
                  category: "part-time", user_id: user.id)
    
    app = { application_text: "An application", job_id: job.id }
    
    email = UserAppMailer.apply_email(app, user).deliver_now
  end
end
