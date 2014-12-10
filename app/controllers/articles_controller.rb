class ArticlesController < ApplicationController
	before_action :set_article, :only => [ :show, :edit, :update, :destroy ]
	def index
		@articles = Article.published.order("published_at DESC")
	end

	def show
#		@article = Article.friendly.find(params[:id])
	end

	def edit
	end
	
	

	private
	def set_article
		@article = Article.friendly.find(params[:id])
	end


end
