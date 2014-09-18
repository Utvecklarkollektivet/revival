class ArticlesController < ApplicationController
	def index
		@articles = Article.published.order("published_at DESC")
	end
	def show
		@article = Article.friendly.find(params[:id])
	end
end
