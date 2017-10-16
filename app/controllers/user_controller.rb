class UserController < ApplicationController
  def index
    @userFlg = current_user.admin_flg
    if @userFlg ==  true
      @userInfo = User.find_by_sql(['select id,email,locked_at from users'])
    else
      redirect_to dashboard_index_path
    end
  end
  
  def changeAccountStatus
    email = params[:email]
    locked_at = ActiveRecord::Base.connection.select_all("SELECT locked_at FROM users WHERE email='#{email}'").to_a[0]["locked_at"]
    if locked_at.nil?
      require 'date'
      time = DateTime.now
      ActiveRecord::Base.connection.select_all("UPDATE users SET locked_at = '#{time}' WHERE email='#{email}'")
    else
      ActiveRecord::Base.connection.select_all("UPDATE users SET locked_at = null WHERE email='#{email}'")
    end
    redirect_to user_index_path, notice: "アカウントステータスを変更しました"
  end
end
