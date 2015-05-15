class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_maintenance

  protected
  
  def check_maintenance
    if Option.all.where(option_key: "modemaintenance").take.try(:option_value) == "1" && request.path != maintenance_path && request.path !~ /admin?/
      redirect_to maintenance_path
    end
  end
end
