module Api
  module V1
    class EvaluacionesController <  ApiController

      def index
        opcion = params[:opcion]
        if opcion == "tienda"
          render :json => ScoreTienda.all
        else
          if opcion=="producto"
            idproducto = params[:idproducto]
            idusuario = params[:idusuario]
            score = Score.where(:user_id => idusuario, :product_id => idproducto ).first
            render :json => score
          else
            render :json => "SE DEBE INGRESAR EL PARAMETRO opcion, CON VALOR tienda O producto"
          end
        end
      end


      def create

        p "EN CREATE DE EVALUACIONES"

        opcion = params[:opcion]

        if opcion == "scoreproducto"
          iduser = params[:user]
          idproducto = params[:producto]
          scoreproducto = params[:scoreproducto]

          if scoreproducto.present?
              score=Score.where(:user_id => iduser, :product_id => idproducto).first
              if score.present?
                score.value=scoreproducto
                score.save
              else
                score = Score.create(:user_id => iduser, :product_id => idproducto, :value => scoreproducto)
              end
              render :json => score
              return
          end
            render :json => "NO HAY SCORE INGRESADO"
            return

        end


        if opcion=="commentProduct"
          idproducto = params[:producto]
          iduser = params[:usuario]
          comentarioproducto=params[:comentario]

          comment = score=Score.where(:user_id => iduser, :product_id => idproducto).first
          if comment.present?
            score.comment = comentarioproducto
            score.save
          else
            score = Score.create(:user_id => iduser, :product_id => idproducto, :comment => comentarioproducto)
          end

          render :json => comment
          return

        end

        iduser = params[:user]
        idorder = params[:order]
        idproveedor = params[:proveedor]
        idproducto = params[:producto]
        scoreproveedor = params[:scoreproveedor]
        scoreproducto = params[:scoreproducto]
        comentarioproveedor=params[:comentarioproveedor]
        comentarioproducto=params[:comentarioproducto]

          if idproveedor.present?
            proveedor = Tienda.find(idproveedor)

          end

          if idproducto.present?
            producto = Product.find(idproducto)
          end



        if scoreproveedor.present?
           @scoretienda=ScoreTienda.new
          @scoretienda.score= scoreproveedor
          @scoretienda.user_id=iduser
          @scoretienda.tienda_id= idproveedor
          @scoretienda.order_id=idorder
          @scoretienda.comentario = comentarioproveedor
        end


        if scoreproducto.present?
          @scoreproductos=Score.new
          @scoreproductos.value=scoreproducto
          @scoreproductos.user_id=iduser
          @scoreproductos.product_id=idproducto
          @scoreproductos.comment = comentarioproducto
          @scoreproductos.save

        end


      end
    end
  end
end
