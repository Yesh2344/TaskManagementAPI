class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.token = SecureRandom.uuid
      user.save
      render json: user, status: :created
    else
      render json: { error: 'Failed to create user' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end