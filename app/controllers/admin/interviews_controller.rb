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

end
