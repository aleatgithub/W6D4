class UsersController < ApplicationController
  def index

    render json: User.all
  end

  def create
    user = User.new(params.require(:user).permit(:username))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    user = User.where(id: params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    user = User.find(params[:id])

    if user.delete 
      render json: user
    else 
      render json: user.errors.full_messages, status: :forbidden
    end
  end


   private 
  def user_params
    params.require(:user).permit(:username)
  end

end