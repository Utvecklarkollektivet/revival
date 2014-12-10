class Admin::ArticlesController < ApplicationController
	before_action :set_article, :only => [ :show, :edit, :update, :destroy ]

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

	def edit
	end

	private
	def article_params
		params.require(:article).permit( :title, :excerpt, :content, :featured_image, :published, :published_at )
	end

end
