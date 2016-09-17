module ApplicationHelper

 def bootstrap_class_for flash_type
    p "en seleccion de flash"
    p flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
end


end
