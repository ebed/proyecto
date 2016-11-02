module Api
  module V1
    class PermisosController <  ApiController

      def index
         users = User.joins(:permisos).where(permisos: {tienda_id: params[:tienda_id]})
         render :json => users
      end

      def create
        p "Crear permiso"
        p params
        permiso = Permiso.new(tienda_id: params[:tienda_id], user_id: params[:user_id], :canadmin => true)
        usuario = User.find(params[:user_id])
        usuario.profile.cansell = true

        usuario.profile.canadminstore= true
        usuario.profile.save

        permiso.save
        render :json => {resultado: "ok"}
      end

      def destroy
        p "Elimina"
        permiso = Permiso.where(:user_id => params[:id], :tienda_id => params[:tienda_id]).first
        permiso.destroy

        usuario = User.find(params[:id])
        usuario.profile.cansell = false

        usuario.profile.canadminstore= false
        usuario.profile.save

        render :json => {resultado: "ok"}

      end


    end
  end
end
