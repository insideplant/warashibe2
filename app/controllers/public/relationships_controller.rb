class Public::RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).follower
    # データの交換
    item1 = Item.find(user.item.id)
    item2 = Item.find(current_user.item.id)
    item1.remove_itemimage!
    item1.itemimage = params[:relationship][:currentitem_itemimage]
    binding.pry
    item1.save
    #item1.update(name: params[:relationship][:currentitem_name],info: params[:relationship][:currentitem_info])
    item2.remove_itemimage!
    item2.itemimage = params[:relationship][:useritem_itemimage]
    item2.save
    # item2.update(name: params[:relationship][:useritem_name],info: params[:relationship][:useritem_info])
    user.unfollow(current_user)
    redirect_to user
  end

  private
    def relationship_params
      params.require(:relationship).permit(:useritem_name,:useritem_info,:useritem_itemimage,:currentitem_name,:currentitem_info,:currentitem_itemimage)
    end
end