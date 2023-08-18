class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    return @user unless @user.nil?

    head :not_found
    nil
  end
end
