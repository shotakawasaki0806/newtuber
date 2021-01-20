class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @video = Video.all.order("created_at DESC")
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

  def show
    @comment = Comment.new
    @comments = @video.comments.order("created_at DESC")
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to video_path(@video)
    else
      render :edit
    end
  end

  def destroy
    if @video.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def video_params
    params.require(:video).permit(:video_name, :video_url, :overview, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def move_to_index
    unless current_user == @video.user
      redirect_to root_path
    end
  end
end
