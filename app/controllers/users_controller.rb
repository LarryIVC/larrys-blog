class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    return @user unless @user.nil?

    head :not_found
    nil
  end
end
