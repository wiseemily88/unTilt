class AdminController <ApplicationController
    before_action :require_admin


  def index
    @competencies = Competency.all
  end

end
