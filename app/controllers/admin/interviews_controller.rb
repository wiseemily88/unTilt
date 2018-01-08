class Admin::InterviewsController <ApplicationController
  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interviewers_options = User.all.map{ |u| [ u.first_name, u.id ] }
    @candidates_options = Candidate.all.map{ |u| [ u.first_name, u.id ] }
    @attributes = Attribute.all
    @interview = Interview.new
  end

  def create

    @interview = Interview.new(interview_params)
    @interview.status = 0
    first_selected = Attribute.find(params[:attribute_ids][0])

    second_selected = Attribute.find(params[:attribute_ids][1])
    third_selected = Attribute.find(params[:attribute_ids][2])
    fourth_selected = Attribute.find(params[:attribute_ids][3])
    @interview.attribute_1=first_selected.id.to_s
    @interview.attribute_2 =second_selected.id.to_s
    @interview.attribute_3 =third_selected.id.to_s
    @interview.attribute_4 =fourth_selected.id.to_s
      byebug



    interviewer = User.find_by(params[:user_id])
    InterviewNotifierMailer.inform(interviewer, interview, interviewer.email).deliver_now
    flash[:notice] = "Successfully sent request to interviewer for upcoming interview."
    if interview.save
      byebug
      flash[:success] = "Created a new for the following date: #{interview.date}"
      redirect_to admin_interviews_path
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  private
    def interview_params
      params.require(:interview).permit(:date, :user_id, :candidate_id)
    end

    def attribute_params
      params.require(:interview).permit(:attribute_ids => [])
    end

end
