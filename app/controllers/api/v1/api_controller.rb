module Api
  module V1
    class ApiController <  ApplicationController

        before_action :add_cors_headers
        skip_before_action :verify_authenticity_token, only: [:create, :destroy]

        rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


        protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

        def record_not_found
          render :json =>  {:code => 200, :descripcion => self.class.name+" con el id "+params[:id]+" no existe"} # Assuming you have a template named 'record_not_found'
        end


        def add_cors_headers
          origin = request.headers["Origin"]
          unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:3000")
            origin = "http://ouzomprod.pzs9xutiam.us-west-2.elasticbeanstalk.com"
          end
          headers['Access-Control-Allow-Origin'] = origin
          headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
          allow_headers = request.headers["Access-Control-Request-Headers"]
          if allow_headers.nil?
            #shouldn't happen, but better be safe
            allow_headers = 'Origin, Authorization, Accept, Content-Type'
          end
          headers['Access-Control-Allow-Headers'] = allow_headers
          headers['Access-Control-Allow-Credentials'] = 'true'
          headers['Access-Control-Max-Age'] = '1728000'
        end


   end
  end
end
