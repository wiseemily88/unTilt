class InterviewCreatorService



  def send_email(interviewer)
    interviewer = User.find_by(params[:user_id])
    
    InterviewNotifierMailer.inform(interviewer, interview, interviewer.email).deliver_now
    flash[:notice] = "Successfully sent request to interviewer for upcoming interview."
    if interview.save
      flash[:success] = "Created a new for the following date: #{interview.date}"
      redirect_to admin_interviews_path
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end



end
