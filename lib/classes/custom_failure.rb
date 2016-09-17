class CustomFailure < Devise::FailureApp

  def redirect
    store_location!
    if flash[:timedout] && flash[:alert]
      flash.keep(:timedout)
      flash.keep(:alert)
    elsif attempted_path != root_path
      flash[:alert] = i18n_message
    end
    redirect_to root_path
  end

  def respond
      if http_auth?
         http_auth
      else

         redirect

      end
  end

end
