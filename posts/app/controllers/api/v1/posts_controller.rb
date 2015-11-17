class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.xml { render xml: @posts }
      format.json {render json: @posts}
    end
  end


end
