class Admin::CandidatesController <ApplicationController
  before_action :require_admin

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    candidate = Candidate.new(candidate_params)

    if candidate.save
      flash[:success] = "Created a new candidate for #{candidate.target_role}"
      redirect_to admin_candidates_path
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :target_role)
  end

end
