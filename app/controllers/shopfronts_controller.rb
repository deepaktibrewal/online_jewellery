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
end
