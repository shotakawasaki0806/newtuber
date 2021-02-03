class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to video_path(@comment.video)
    else
      @video = @comment.video
      @comments = @video.comments.order("created_at DESC")
      @replies = @comments
      render "videos/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :reply_comment_id).merge(user_id: current_user.id, video_id: params[:video_id])
  end
end
