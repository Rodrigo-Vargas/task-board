class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
  
      redirect_to board_path
    else
      flash[:notice] = "Form with errors"
      flash[:color] = "invalid"
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
