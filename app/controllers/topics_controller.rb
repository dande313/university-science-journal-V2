class TopicsController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    @topic = Topic.new
    @article= Article.find_by(id: params[:id])
    if !can_edit?
    	redirect_to ("/articles/#{@article.id}/")
    end
  end

  def create
   	@topic = Topic.find_or_initialize_by(topic_params)
   	@article= Article.find_by_id(article_param[:article_id])
  	if @topic.save
  		@article.topics<< @topic
      add_comment_if_present
  		redirect_to ("/articles/#{@article.id}/edit")
  	else
  		format.html { render :new }
  	end
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @topic}
    end
  end

  def topic_params
    params.require(:topic).permit(:name, :department_id)
   end

   def article_param
    params.require(:topic).permit(:article_id)
   end

  def comment_param
    params.require(:topic).permit(:comment, :article_name)
  end


  private

    def can_edit?
      !!((current_user.professor? && current_user.department == @article.user.department) || @article.user == current_user)
    end

    def add_comment_if_present
      articletopic = ArticleTopic.find_by(article_id: @article.id, topic_id: @topic.id)
      if comment_param[:comment] != nil && comment_param[:comment].strip != ""
        articletopic.comment = comment_param[:comment]
        articletopic.article_name = comment_param[:article_name]
        articletopic.save
      end
    end
end
