class JobsController < ApplicationController
  layout "jobs"
  
  def index
    @jobs = Job.all
  end
  
  def full_time
    @jobs = Job.where(category: "full-time")
    render 'jobs/index'
  end
  
  def part_time
    @jobs = Job.where(category: "part-time")
    render 'jobs/index'
  end
  
  def contract
    @jobs = Job.where(category: "contract")
    render 'jobs/index'
  end
  
  def free_lance
    @jobs = Job.where(category: "freelance")
    render 'jobs/index'
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    
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
end
