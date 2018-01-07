class Admin::NotificationController <ApplicationController

  def create
  interviewer = User.find_by(params[:user_id])
  interview = Interview.find_by(params[:id])

  InterviewNotifier.inform(interviewer, interview, interviewer.email).deliver_now
  flash[:notice] = "Successfully sent request to interviewer for upcoming interview."
  redirect_to admin_dashboard_path
  end
end
