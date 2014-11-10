class Admin::AdminController < ApplicationController
  before_action :authorize

  def authorize
    redirect_to new_user_session_path unless user_signed_in?
  end

end
