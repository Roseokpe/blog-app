class UsersController < ApplicationController
  def index
    # @users = User.all
    @greetings = 'Hello World!'
  end

  def show
    @user = User.find(params[:id])
  end
end
