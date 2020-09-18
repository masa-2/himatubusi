class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to root_path, success: "投稿できました！"
    else
      flash.now[:danger] = "投稿に失敗しました！！再度お願いします"
      render :new
    end
  end
  
  def index
    @topic = Topic.where("description LIKE ?", "%params[:description]%")
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description, :topic_category_id)
  end
end
