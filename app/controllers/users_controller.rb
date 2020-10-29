class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # binding.irb
    @user = User.find(params[:id])
  end
end
