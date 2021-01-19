class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:video_name, :video_url, :overview, :genre_id, :image).merge(user_id: current_user.id)
  end
end
