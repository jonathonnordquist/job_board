require 'rails_helper'

RSpec.describe UserAppsController, type: :controller do
  before(:all) do
    @user = User.create(FactoryGirl.attributes_for(:user_app_cont_user))
    job_params = FactoryGirl.attributes_for(:part_time_job)
    job_params[:user_id] = @user.id
    @job = Job.create(job_params)
  end
  
  after(:all) do
    @user.destroy
    @job.destroy
  end
  
  let(:user) { @user }
  let(:job) { @job }
  
  it 'new method renders the application view' do
    get(:new, :id => job[:id])
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end
  
  describe 'submitting an application' do
    it 'with correct infrormation sends email and routes user to the landing page' do
      session[:user_id] = user.id
      app_params = { :job_id => job[:id],
                    :application_text => "Application text" }
                    
      post(:send_app, :user_apps => app_params)
      
      expect(ActionMailer::Base.deliveries.length).not_to be 0
      expect(flash[:good]).to eq('Your application has been submitted')
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
    end
    
    it 'with incorrect infromation routes user back to form with error' do
      job = Job.last
      session[:user_id] = user.id
      app_params = { :job_id => job[:id],
                    :application_text => "" }
                    
      post(:send_app, :user_apps => app_params)
      
      expect(flash.now[:danger]).to eq('Please enter a note as to why you would be great for this position')
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new, :id => job.id)
    end
    
  end
end
