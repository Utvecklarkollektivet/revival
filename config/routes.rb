Rails.application.routes.draw do
  devise_for :users
	resources :articles, :path => "artiklar"

	get "/medlemmar" => "members#index", :as => 'members'
	get "/medlemmar/:id" => "members#show", :as => 'user'

	root :to => "home#index"
	
	namespace :admin do
		resources :articles
		root :to => "articles#index"
	end


end
