require "rails_helper"

RSpec.describe UserAppMailer, type: :mailer do
  it 'apply_email with correct subject, body and to correct address' do
    user = FactoryGirl.build(:mailer_user)
    user.save
    
    desc = "This is a description.  This is a description.  This is a description.  
            This is a description.  This is a description.  This is a description.  
            This is a description.  This is a description.  This is a description."
    job = Job.create(title: "title", company: "company", description: desc,
                  category: "part-time", user_id: User.last.id)
    
    app = { application_text: "An application", job_id: job.id }
    
    email = UserAppMailer.apply_email(app, user).deliver_now
    
    expect(ActionMailer::Base.deliveries.length).not_to be 0

    expect(email.subject).to eq "Welcome"
    expect(email.from[0]).to eq "from@example.com"
    expect(email.html_part.body.to_s).to match /An application/
    expect(email.html_part.body.to_s).to match /Application submitted by: #{user.name}/
    expect(email.html_part.body.to_s).to match /Applicants email is: #{user.email}/
  end
end
