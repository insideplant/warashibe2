class Public::HomesController < ApplicationController
  def top
    @users = User.order(updated_at: :desc).limit(6);
  end

  def newuser
    @item = Item.new
    @user = User.find(current_user.id)
  end
end
