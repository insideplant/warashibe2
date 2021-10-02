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
    @user = User.find(params[:id])
    @user.update(user_params)
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { render json: {avatar: @user.avatar}}
    end
  end

  private
    def user_params
      params.permit(:avatar)
    end
end
