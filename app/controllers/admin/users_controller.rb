class Admin::UsersController <ApplicationController
  before_action :require_admin
  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    @user.role = 0
    if @user.save
      flash[:success] = "Created a new #{@user.first_name}"
      redirect_to admin_users_path

    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :job_title, :department)
  end

end
