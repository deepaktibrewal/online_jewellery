class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:email] = @user.id
      flash[:notice] = "you are now logged in."
      user_type=@user.user_type
      if user_type=="admin"
        redirect_to(categories_path)
      else
        redirect_to(shopfronts_view_path)
      end
    else
      render('new')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_type, :contact, :address, :password)
  end
end
