class UsersController <ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 1
    if @user.save
      flash[:success] = "Welcome #{@user.email}"
      session[:user_id] = @user.id
      redirect_to admin_dashboard_path
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to dashboard_path
  end
  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :job_title, :department, :password)
  end
end
