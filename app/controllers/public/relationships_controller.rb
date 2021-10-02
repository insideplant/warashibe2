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
    item1_1 = Item.find(user.item.id)
    item2 = Item.find(current_user.item.id)
    item1.update(user_id: item2.user_id, name: item2.name, info: item2.info)
    item2.update(user_id: item1_1.user_id, name: item1_1.name, info: item1_1.info)
    user.unfollow(current_user)
    redirect_to current_user
  end

  private
    def relationship_params
      params.require(:relationship).permit(:useritem_name,:useritem_info,:useritem_itemimage,:currentitem_name,:currentitem_info,:currentitem_itemimage)
    end
end