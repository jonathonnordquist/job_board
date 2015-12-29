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
      p job[:description]
      expect(assigns(:job)[:description]).to eq(job[:description])
    end
  end
end
