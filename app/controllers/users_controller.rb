class UsersController < ApplicationController
  
  def index
    @userFlg = current_user.admin_flg
    redirect_to dashboard_index_path if @userFlg ==  false 
  end
end
