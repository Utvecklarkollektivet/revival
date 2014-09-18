class Admin::ArticlesController < ApplicationController
	def index
		@articles = Article.all.order(:created_at)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		
		if @article.save
			redirect_to @article
		end
	end

	private
	def article_params
		params.require(:article).permit( :title, :excerpt, :content, :featured_image )
	end

end
