class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  def create
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      render json: @comment.errors, status: :locked
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
