class Public::HomesController < ApplicationController
  def top
    @users = User.all
  end

  def newuser
    @user = User.find(current_user.id)
  end
end
