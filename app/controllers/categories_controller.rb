class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to @category
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

end