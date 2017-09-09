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
    @user=User.find(session[:email])
    @items=@user.items
    if @items.empty?
      flash[:notice] = "your cart is empty."
      redirect_to(shopfronts_view_path)
    end
  end

  def wishlist
    @user=User.find(session[:email])
    @user.items << Item.find(params[:itm])
    @items=@user.items
    redirect_to(shopfronts_cart_path)
  end

  def usermail
    @user=User.find(session[:email])
    @items=Item.find(session[:cart_item])
    UserMailer.welcome_email(@user,@items).deliver_now
    redirect_to(shopfronts_view_path)
  end
end
