class UsersController <ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 1

    if @user.save
      flash[:success] = "Logged in as #{@user.email}"
      session[:user_id] = @user.id
      redirect_to '/admin_dashboard'
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :job_title, :department)
  end
end
