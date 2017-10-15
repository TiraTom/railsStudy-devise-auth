class UserController < ApplicationController
  def index
    @userFlg = current_user.admin_flg
    if @userFlg ==  true
      @userInfo = User.find_by_sql(['select id,email,locked_at from users'])
    else
      redirect_to dashboard_index_path
    end
  end
end
