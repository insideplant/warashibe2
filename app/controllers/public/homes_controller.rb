class Public::HomesController < ApplicationController
  def top
    @users = User.all
  end

  def newuser
    
  end
end
