class Public::ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    respond_to do |format|
      format.html
      format.json
    end
    redirect_to user_path current_user
  end

  def new
  end

  private
    def item_params
      params.permit(:name, :info, :itemimage)
    end
end
