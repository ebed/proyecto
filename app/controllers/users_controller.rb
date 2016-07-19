class UsersController < ApplicationController
  def index
    @usuarios = User.all
  end
end
