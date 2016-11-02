module Api
  module V1
    class UsersController <  ApiController

      def index


        if params[:tienda_id].blank?
          users = User.all
        else
          usuariosexistentes =  Permiso.where(:tienda_id => params[:tienda_id]).pluck(:user_id)
          usuariosexistentes << Tienda.where(:id => params[:tienda_id])).joins(seller: :user).pluck("users.id")

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
