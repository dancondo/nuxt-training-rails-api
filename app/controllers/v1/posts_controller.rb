class V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  skit_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post
    else
      render json: 'Error'
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: 'Error'
    end
  end

  def destroy
    if @post.destroy
      render json: Post.all
    else
      render json: 'Error'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
