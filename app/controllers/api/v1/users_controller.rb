module Api
  module V1
    class UsersController <  ApiController

      def index


        if params[:tienda_id].blank?
          users = User.all
        else
          usuariosexistentes =  Permiso.where(:tienda_id => params[:tienda_id]).pluck(:user_id)
          if usuariosexistentes.blank?
            usuariosexistentes= Tienda.where(:id => params[:tienda_id])).joins(seller: :user).pluck("users.id")
          else
            usuariosexistentes = usuarioexistentes + Tienda.where(:id => params[:tienda_id])).joins(seller: :user).pluck("users.id")
          end
          if !usuariosexistentes.blank?
            users = User.where('id not in (?)', usuariosexistentes)
          else
            users = User.all
          end

        end
         p users
        render :json => users
      end


    end
  end
end
