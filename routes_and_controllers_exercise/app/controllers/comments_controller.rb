class CommentsController < ApplicationController
  def index
    if params[:user_id]
        user = User.find_by_id(params[:user_id])
        render json: user.comments
    elsif params[:artwork_id]
        artwork = Artwork.find_by_id(params[:artwork_id])
        render json: artwork.comments
    else
        render json: Comment.all
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
        render json: comment
    else
        render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    destroyed_comment = Comment.find_by_id(params[:id]).destroy
    render json: destroyed_comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end