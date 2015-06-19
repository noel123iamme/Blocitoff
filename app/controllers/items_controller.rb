class ItemsController < ApplicationController
  def create
  	@user = current_user
  	@item = current_user.items.build(item_params)
  	@new_item = Item.new

  	authorize @item
  	if @item.save 
  		flash[:notice] = "Item was saved."
  	else
  		flash[:error] = "Error saving item."
  	end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def destroy
  	@item = Item.find(params[:id])
  	
  	authorize @item
  	if @item.destroy
  		flash[:notice] = "Item was deleted."
  	else
  		flash[:error] = "Error deleting item."
  	end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  private

  def item_params
  	params.require(:item).permit(:name)
  end
end
