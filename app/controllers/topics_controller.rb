class TopicsController < ApplicationController
  PER = 3
  
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
  
  def show
    @topics = current_user.topics.page(params[:page]).per(PER)
  end
  
  def edit
    @topic = current_user.topics.find_by(id:params[:id])
  end
  
  def update
    @topic = current_user.topics.find_by(id:params[:id])
    @topic.update(topic_params)
    redirect_to root_path
  end
  
  def destroy
    topic = current_user.topics
    topic.destroy!
    redirect_to topic_path(topic)
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description, :topic_category_id)
  end
end
