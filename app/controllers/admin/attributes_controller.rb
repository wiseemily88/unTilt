class Admin::AttributesController <ApplicationController

  def new
    @attribute = Attribute.new
  end

  def create
    attribute = Attribute.new(attribute_params)

      if attribute.save
        flash[:success] = "Created a new attribute"
        redirect_to admin_dashboard_path
      else
        render :new
        flash[:danger] = "Try again! Information is wrong."
      end
  end

  def edit
    @attribute = Attribute.find(params[:id])
  end

  def update
    @attribute = Attribute.find(params[:id])
    @attribute = Attribute.update(attribute_params)
    redirect_to admin_dashboard_path

  end


  private
  def attribute_params
    params.require(:attribute).permit(:name,:description)
  end

end
