class JobsController < ApplicationController
  def index
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    
    if @job.save
      
    else
      render 'new'
    end
  end

  def show
  end
  
  private
    def job_params
      params.require(:job).permit(:company, :title, :description, :category)
    end
end
