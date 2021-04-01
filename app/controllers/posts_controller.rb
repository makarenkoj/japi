class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :set_current_user_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def create
    @post = Post.create(post_params.merge(user: current_user))

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render :show, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
  end

  private
  def set_current_user_post
    @post = current_user.posts.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
