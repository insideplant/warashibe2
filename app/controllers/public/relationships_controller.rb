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
    item1.update(user_id: item2.user_id, itemname: item2.itemname, info: item2.info)
    item2.update(user_id: item1_1.user_id, itemname: item1_1.itemname, info: item1_1.info)
    followers = current_user.followers
    followers.each do |follower|
      follower.unfollow(current_user)
    end
    redirect_to current_user
  end

  private
    def relationship_params
      params.require(:relationship).permit(:useritem_name,:useritem_info,:useritem_itemimage,:currentitem_name,:currentitem_info,:currentitem_itemimage)
    end
end