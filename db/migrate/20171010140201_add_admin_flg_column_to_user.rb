class AddAdminFlgColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_flg, :boolean, :null => false, :default => false, :after => :email
  end
end
