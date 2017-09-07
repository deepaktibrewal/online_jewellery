class ShopfrontsController < ApplicationController
  def view
    session[:cart_item] ||= []
    @categories=Category.all
    unless params[:q]==nil
      @category=Category.find(params[:q])
      @items=@category.items.all
    else
      @items=Item.all
    end

  end

  def cart
    session[:cart_item] << params[:itm]
    @items=Item.find(session[:cart_item])
  end

  def usermail
    @user=User.find(session[:email])
    @items=Item.find(session[:cart_item])
    UserMailer.welcome_email(@user,@items).deliver_now
    redirect_to(shopfronts_view_path)
  end
end
