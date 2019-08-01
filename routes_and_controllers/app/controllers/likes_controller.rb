class LikesController < ApplicationController

  def index
    if params.has_key?(:user_id)
      render json: User.find(params[:user_id]).likes
    elsif params.has_key?(:artwork_id)
      render json: Artwork.find(params[:artwork_id]).likes
    elsif params.has_key?(:comment_id)
      render json: Comment.find(params[:comment_id]).likes
    else
      render json: Like.all
    end
  end

  def create
    like = Like.new(like_params)

    if like.save 
      render json: like 
    else 
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(like_params[:id])

    if like.delete
      render json: like
    else
      render json: like.errors.full_messages, status: :forbidden
    end
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :likable_type, :likable_id)
  end
end
