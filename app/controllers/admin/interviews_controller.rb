class Admin::InterviewsController <ApplicationController
  before_action :require_admin
  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interviewers_options = User.all.map{ |u| [ u.first_name, u.id ] }
    @candidates_options = Candidate.all.map{ |u| [ u.first_name, u.id ] }
    @competencies = Competency.all
    @interview = Interview.new
    competency = @interview.competencies.build
    competency.questions.build
  end

  def create

    interview = Interview.new(interview_params)
    interview.status = 0
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

  def edit
    @interview = Interview.find(params[:id])
    @interviewers_options = User.all.map{ |u| [ u.first_name, u.id ] }
  end

  def update
    interview = Interview.find(params[:id])
    interview.update(interview_params)

    flash[:success] = "Updated the interview for the following candidate: #{interview.candidate.first_name}"
    redirect_to admin_interviews_path
  end

  private
    def interview_params
      params.require(:interview).permit(:date, :user_id, :candidate_id, :status, :competencies => [:id, :name, :questions => [:id]])
    end




end
