class Admin::CompetenciesController <ApplicationController
  before_action :require_admin
  def new
    @competency = Competency.new
  end

  def create
    competency = Competency.new(competency_params)

      if competency.save
        flash[:success] = "Created a new competency"
        redirect_to admin_dashboard_path
      else
        render :new
        flash[:danger] = "Try again! Information is wrong."
      end
  end

  def edit
    @competency = Competency.find(params[:id])
  end

  def update
    competency = Competency.find(params[:id])
    competency.update(competency_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    competency = Competency.find(params[:id])
    competency.destroy
    redirect_to admin_dashboard_path
  end

  private
  def competency_params
    params.require(:competency).permit(:name,:description)
  end

end
