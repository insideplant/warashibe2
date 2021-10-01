class Public::ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { render json: {name: @item.name, info: @item.info, itemimage: @item.itemimage}}
    end
  end

  def new
  end

  private
    def item_params
      params.permit(:name, :info, :itemimage)
    end
end
