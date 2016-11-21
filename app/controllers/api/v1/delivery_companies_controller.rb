module Api
  module V1
    class DeliveryCompaniesController <  ApiController


      def index
        render :json => {code: 200, resultado: DeliveryCompany.all}
      end

    end
  end
end
