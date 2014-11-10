class Admin::AdminController < ApplicationController
  before_action :authorize

  def authorize
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
