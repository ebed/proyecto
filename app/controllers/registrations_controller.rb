# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    u = User.new(sign_up_params)
    cantidadUsuarios = User.all.count
    if  cantidadUsuarios > 0
      u.profile_id = 2
    else
      u.profile_id = 1
    end
    if u.save
      flash[:notice] = "CREACION EXITOSA DE USUARIO, INGRESE SUS CREDENCIALES"
      redirect_to new_user_session_path
    else
      flash[:alert] = "CREACION DE USUARIO FALLIDA, VUELVA A INTENTARLO"
    end
    # add custom create logic here
  end

  def update
    super
  end


  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
