class UserAppsController < ApplicationController
  def new
    @job = Job.find(params[:id])
  end
  
  def send_app
    @job = Job.find(app_params[:job_id])
    if !app_params[:application_text].empty?
      UserAppMailer.apply_email(app_params, current_user).deliver_now
      flash[:success] = "Your application has been submitted"
      redirect_to job_path(@job.id)
    else
      flash.now[:danger] = "Please enter a note as to why you would be great for this position"
      render 'new'
    end
  end
  
  private
    def app_params
      params.require(:user_apps).permit(:job_id, :application_text)
    end
end
