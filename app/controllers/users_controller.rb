class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def new
    @user = User.new
  end
end
