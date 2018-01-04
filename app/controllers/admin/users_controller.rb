class Admin::UsersController <ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 0

    if @user.save
      flash[:success] = "Created a new #{@user.first_name}"

      redirect_to '/dashboard'
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

end
