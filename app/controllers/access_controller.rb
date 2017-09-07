class AccessController < ApplicationController

  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]
  def shop_front
    @categories=Category.all
    @items=Item.all
    @category_id=Category.find(params[:category_id])
    @items=@category.items.all
    render('shop_front')
  end

  def submit_category
    @category=Category.find(params[:category_id])
    @items=@category.items.all
    render('shop_front')
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
      user_type=authorized_user.user_type
      if user_type=="admin"
        redirect_to(categories_path)
      else
        redirect_to(shopfronts_view_path)
      end
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
