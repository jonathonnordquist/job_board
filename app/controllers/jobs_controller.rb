class JobsController < ApplicationController
  before_action :require_login, only: [:create, :new]
  
  layout "jobs"
  
  def index
    @title = "All Available Jobs"
    @jobs = Job.all
  end
  
  def full_time
    @title = "Available Full Time Jobs"
    @jobs = Job.where(category: "full-time")
    render 'jobs/index'
  end
  
  def part_time
    @title = "Available Part Time Jobs"
    @jobs = Job.where(category: "part-time")
    render 'jobs/index'
  end
  
  def contract
    @title = "Available Contract Jobs"
    @jobs = Job.where(category: "contract")
    render 'jobs/index'
  end
  
  def free_lance
    @title = "Available Freelance Jobs"
    @jobs = Job.where(category: "freelance")
    render 'jobs/index'
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    @job[:user_id] = current_user[:id]
    
    if @job.save
      flash[:success] = "Job has been posted successfully"
      redirect_to @job
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
  end
  
  private
    def job_params
      params.require(:job).permit(:company, :title, :description, :category)
    end

    def require_login
      unless logged_in?
        flash[:error] = "Please log in to access this page"
        redirect_to login_path
      end
    end
end
