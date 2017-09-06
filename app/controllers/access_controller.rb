class AccessController < ApplicationController

  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]
  def shop_front
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user=User.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:email] = authorized_user.id
      flash[:notice] = "you are now logged in."
      redirect_to(categories_path)
    else
      flash.now[:notice] = "Invalid username/password combination"
      render('login')
    end
  end

  def logout
    session[:email] = nil
    flash[:notice] = 'logged out'
    redirect_to(access_login_path)
  end

  
end
