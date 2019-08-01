class CommentsController < ApplicationController

  def index
    if params.has_key?(:user_id) && params.has_key?(:artwork_id)
      render json: Comment.where(user_id: params[:user_id], artwork_id: params[:artwork_id])
    elsif params.has_key?(:user_id)
      render json: Comment.where(user_id: params[:user_id])
    elsif params.has_key?(:artwork_id)
      render json: Comment.where(artwork_id: params[:artwork_id])
    else 
      render json: Comment.all
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    comment = Comment.find(comment_params[:id])

    if comment.delete
      render json: comment
    elsif comment
      render json: comment.errors.full_messages, status: :forbidden
    else
      render plain: 'Comment not found', status: :not_found
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
