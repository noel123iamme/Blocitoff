class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def show
  		@user = User.find(params[:id])
  		@items = @user.items
  		@item = Item.new
	end
end
