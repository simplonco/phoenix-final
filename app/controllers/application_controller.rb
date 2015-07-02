class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_maintenance

  protected
  
  def check_maintenance
    if Option.all.where(option_key: "mode_maintenance").take.try(:option_value) == "Oui" && request.path != maintenance_path && request.path !~ /admin?/ && request.path !~ /options?/
      redirect_to maintenance_path
    end
  end
end
