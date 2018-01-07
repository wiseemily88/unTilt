class AdminController <ApplicationController
  # before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def index
    @attributes = Attribute.all
  end

end
