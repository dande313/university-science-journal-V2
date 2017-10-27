class DepartmentsController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  	@department_id = params[:id]
  	@articles = Article.all.collect {|article| next if article.user.department.id != @department_id.to_i; article}.compact
  	@article = @articles.first
  end
end
