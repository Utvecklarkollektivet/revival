class MembersController < ApplicationController
	def index
		@members = User.all.order("role_id ASC, name ASC")
	end

	def show
		@member = User.find(params[:id])
	end
end
