class CommentsController < ApplicationController
  
  def new
    @topic = Topic.find_by(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to root_path, success: "コメントしました!"
    else
      flash.now[:danger] ="コメント失敗!"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
end
