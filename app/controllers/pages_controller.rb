class PagesController < ApplicationController
  PER = 1
  
  def index
    @topics = Topic.page(params[:page]).per(PER)
  end
end
