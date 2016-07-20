class UsersController < ApplicationController
  def index
    @usuarios = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
