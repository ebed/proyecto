# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController

 def new
    super
    # My thought here was just to call super
    # and let Devise handle as normal w/o defining anything custom
  end

  def create

    super

  end

  def destroy
    super
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


end
