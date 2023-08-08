class ApplicationController < ActionController::Base
  def current_user
    # It will return the first user from the database.
    @current_user ||= User.first
  end
end
