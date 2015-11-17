class Api::V2::UsersController < ApplicationController

  before_action :authenticate#, only: [:index]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by auth_token: token
    end
  end


  # Basic Auth
  # def authenticate
  #   authenticate_or_request_with_http_basic('Users') do |username, password|
  #     User.authenticate(username, password)
  #   end
  # end


end
