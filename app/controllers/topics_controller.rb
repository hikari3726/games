class TopicsController < ApplicationController
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to user_path(id: @topic.user_id), success: '投稿しました'
    else
      render :new
    end
  end
  
  def index
    @topics = Topic.all
  end
  
  private
  def topic_params
    params.require(:topic).permit(:user_id, :image, :title, :description, :genre, :participation, :target_age, :play_time, :price, :evalution)
  end
  
end
