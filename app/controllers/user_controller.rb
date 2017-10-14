class UserController < ApplicationController
  def index
    @userFlg = current_user.admin_flg
    @emailInfo = User.select("email")
    if @userFlg ==  true

    else
      redirect_to dashboard_index_path
    end
  end
end
