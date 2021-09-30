class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = Item.new
    @uploaded_items = @user.item
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  private
end
