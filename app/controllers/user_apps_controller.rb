class UserAppsController < ApplicationController
  def new
    @job = Job.find(params[:id])
  end
  
  def send_app
    @job = Job.find(app_params[:job_id])
    UserAppMailer.apply_email(app_params).deliver_now
    render 'new'
  end
  
  private
    def app_params
      params.require(:user_apps).permit(:job_id, :application_text)
    end
end
