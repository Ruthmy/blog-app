class ApplicationController < ActionController::Base
  def current_user
    @user = User.first
  end
end
