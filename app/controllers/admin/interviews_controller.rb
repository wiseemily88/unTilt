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
    @interview = Interview.new
  end

  def create
    interview = Interview.new(interview_params)
    interview.status = 0

    if interview.save
      flash[:success] = "Created a new for the follwing date: #{interview.date}"
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

end
