module Api
  module V1
    class SellersController <  ApiController

      def create
        p "EN create seller"
        p "Parametro recibido", params[:id], "   y ",params[:user_id]
        @user = User.find(params[:user_id])
        if @user.seller.blank?
          seller = Seller.new(user_id: params[:user_id], name: @user.name)

          if seller.save
            render :json => "Creación Exitosa!", status: 200
          else
            render :json => "Problemas creando el vendedor"
          end
        else
          @seller = @user.seller

          @seller.habilitado = true
          if @seller.save
             render :json => {descripcion: "Habilitacion Exitosa!", status: 200}
          else
            render :json => "Problemas Habilitando el vendedor"
          end
        end

      end

      def destroy
        p "En destroy "
        @seller = Seller.where(:user_id =>params[:id]).first
        @seller.habilitado = false
        p @seller
        if @seller.save
          p "guardado exitoso"
          render :json => {descripcion: "Deshabilitacion Exitosa", status: 200}
        else
          p "guardado con problemas"
          render :json => "Problemas deshabilitando el vendedor"
        end

      end


    end
  end
end
