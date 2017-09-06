class CategoriesController < ApplicationController

  before_action :confirm_logged_in
  def index
    @categories=Category.all
    render('index')
  end

  def show
    @category=Category.find(params[:id])
  end

  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(categories_path)
    else
      render('edit')
    end
  end

  def delete
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to(categories_path)
  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
