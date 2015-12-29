require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  before(:all) do
    3.times do
      part_time_job = FactoryGirl.build(:part_time_job)
      part_time_job.save
      full_time_job = FactoryGirl.build(:full_time_job)
      full_time_job.save
      contract_job = FactoryGirl.build(:contract_job)
      contract_job.save
      freelance_job = FactoryGirl.build(:freelance_job)
      freelance_job.save
    end
  end
  
  after(:all) do
    Job.all.each do |job|
      job.destroy
    end
  end
    
  context 'for all users' do
    descript_base = "method renders job view passing"
    
    def job_cat_tests(category)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(assigns(:jobs)).to eq(Job.where(category: category))
    end
    
    it "index method #{descript_base} all jobs" do
      get(:index)
      
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(assigns(:jobs)).to eq(Job.all)
    end
    
    it "full_time #{descript_base} only full time jobs" do
      get(:full_time)
      
      job_cat_tests("full-time")
    end
    
    it "part_time #{descript_base} only part time jobs" do
      get(:part_time)
      
      job_cat_tests("part-time")
    end
    
    it "contract #{descript_base} only contract jobs" do
      get(:contract)
      
      job_cat_tests("contract")
    end
    
    it "contract #{descript_base} only freelance jobs" do
      get(:free_lance)
      
      job_cat_tests("freelance")
    end
    
    it "show method renders an individual job view" do
      job = Job.first
      get :show, :id => job.id
      
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(assigns(:job)[:description]).to eq(job[:description])
    end
  end
  
  context 'for logged in users' do
    before(:all) do
      @user = FactoryGirl.build(:jobs_user)
      @user.save
    end
    
    after(:all) do
      User.all.each do |user|
        user.destroy
      end
    end
    
    let(:user) { @user }
    
    it 'new method renders the new job view' do
      session[:user_id] = user.id
      get :new
      
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
    
    it 'create method adds a new job and redirects to the job view on success' do
      session[:user_id] = user.id
      job_count = Job.count
      
      new_job = FactoryGirl.attributes_for(:part_time_job)
      post :create, :job => new_job
      
      expect(response).to have_http_status(302)
      expect(response).to redirect_to :action => :show, :id => Job.last.id
      expect(flash[:success]).to eq "Job has been posted successfully"
      expect(Job.count).to eq(job_count + 1)
    end
    
    it 'create method renders the new job page and does not create on failure' do
      session[:user_id] = user.id
      job_count = Job.count
      
      new_job = FactoryGirl.attributes_for(:invalid_job)
      post :create, :job => new_job
      
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
      expect(Job.count).to eq(job_count)
    end
  end
  
  context 'for non logged in user' do
    it 'new method redirects to the log in page' do
      get :new
      
      expect(response).to have_http_status(302)
      expect(response).to redirect_to '/login'
      expect(flash[:error]).to eq "Please log in to access this page"
    end
    
    it 'create method redirects to the log in page' do
      job_count = Job.count
      
      new_job = FactoryGirl.attributes_for(:part_time_job)
      post :create, :job => new_job
      
      expect(response).to have_http_status(302)
      expect(response).to redirect_to '/login'
      expect(flash[:error]).to eq "Please log in to access this page"
      expect(Job.count).to eq(job_count)
    end
  end
end
