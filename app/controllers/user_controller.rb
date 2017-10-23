class UserController < ApplicationController
  def index
    @userFlg = current_user.admin_flg
    if @userFlg ==  true
      @userInfo = User.all
    else
      redirect_to dashboard_index_path
    end
  end
  
  def change_account_status
    user_id = params[:user_id]
    user = User.find(user_id)

    if user.locked_at.nil?
      require 'date'
      time = DateTime.now
      user.update(locked_at: time)
    else
      user.update(locked_at: nil)
    end
    redirect_to user_index_path, notice: "アカウントステータスを変更しました"
  end
end
