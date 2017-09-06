class ItemsController < ApplicationController
  def index
    @items=Item.all
    render('index')
  end

  def show
    @item=Item.find(params[:id])
    @categories=Category.all
  end

  def new
    @item=Item.new
    @categories=Category.all
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to(items_path)
    else
      @categories=Category.all
      render('new')
    end
  end

  def edit
    @item=Item.find(params[:id])
    @categories=Category.all
  end

  def update
    @item=Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to(items_path)
    else
      @categories=Category.all
      render('edit')
    end
  end

  def delete
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to(items_path)
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :description, :image)
  end
end
