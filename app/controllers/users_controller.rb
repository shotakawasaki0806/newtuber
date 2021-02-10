class UsersController < ApplicationController
  before_action :set_user
  before_action :move_to_index, only: [:edit, :update]

  def edit
    @sns = SnsCredential.find_by(user_id: current_user.id)
  end
  
  def update
    if params[:sns_auth] != nil
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
      @sns = params[:sns_auth]
    end
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      user_params = params.require(:user).permit(:email, :channel_name, :channel_url, :introduction, :genre_id, :image)
    else
      user_params = params.require(:user).permit(:email, :password, :password_confirmation, :channel_name, :channel_url, :introduction, :genre_id, :image)
    end
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to user_path(@user)
    else
      @sns = params[:sns_auth]
      render :edit
    end
  end

  def show
  end

  private

  def move_to_index
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
