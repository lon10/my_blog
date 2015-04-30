class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def after_sign_in_path_for(_resource)
    admin_path
  end
end
