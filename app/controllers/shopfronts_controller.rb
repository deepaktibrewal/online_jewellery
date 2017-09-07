class ShopfrontsController < ApplicationController
  def view
    @categories=Category.all
    unless params[:q]==nil
      @category=Category.find(params[:q])
      @items=@category.items.all
    else
      @items=Item.all
    end
  end

  def cart
  end
end
