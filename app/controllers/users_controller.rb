class UsersController < ApplicationController
  before_action :move_to_index, only: [:edit, :update]

  def edit
  end
  
  def update
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :channel_name, :channel_url, :introduction, :genre_id, :image)
  end

  def move_to_index
    @user = User.find(params[:id])
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end
end
