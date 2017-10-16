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
    user = User.find_by_sql(["SELECT * FROM users WHERE email='#{email}'"])
    if user.locked_at.nil?
      require 'date'
      time = DateTime.now
      User.find_by_sql(["UPDATE users SET	locked_at = '#{time}' WHERE email='#{email}'"])    
    else
      User.find_by_sql(["UPDATE users SET	locked_at = nil WHERE email='#{email}'"])    
    end
    redirect_to user_index_path
  end
end
