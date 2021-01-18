class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show ]
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
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

  def edit 
  end

  def update
      if @category.update(category_params)
        flash[:notice] = "Category was successfully updated"
        redirect_to @category
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def category_params
    params.require(:category).permit(:name)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = 'You are not allowed to perform this action'
      redirect_to categories_path
    end
  end

end