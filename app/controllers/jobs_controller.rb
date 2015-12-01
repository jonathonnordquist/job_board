class JobsController < ApplicationController
  layout "jobs"
  
  def index
    @jobs = Job.all
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
