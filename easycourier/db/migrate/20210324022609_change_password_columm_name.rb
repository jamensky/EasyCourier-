class ChangePasswordColummName < ActiveRecord::Migration[5.2]
  def change
    rename_column :couriers, :password, :password_digest
  end
end
