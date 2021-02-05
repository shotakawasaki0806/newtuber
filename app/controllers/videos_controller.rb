class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :category]
  before_action :set_video, except: [:index, :new, :create, :search, :category]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @video = Video.includes(:user).order("created_at DESC")
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
    @comments = @video.comments.includes(:user).order("created_at DESC")
    @replies = @comments
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

  def search
    if params[:keyword].present?
      @keyword = params[:keyword]
      split_keywords = (params[:keyword]).split(/[[:blank:]]+/)
      @videos = Video
      split_keywords.each do |keyword|
        @videos = @videos.search(keyword)
      end
      @videos = @videos.includes(:user)
    else
      @videos = Video.search(params[:keyword])
    end
  end

  def category
    if params[:id].to_i > 1 && params[:id].to_i < 23
    @videos = Video.where(genre_id: params[:id]).includes(:user).order("created_at DESC")
    @genre = Genre.find(params[:id])
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
