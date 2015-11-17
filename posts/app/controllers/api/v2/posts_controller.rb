class Api::V2::PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts, serialize: PostSerializer
  end

end

