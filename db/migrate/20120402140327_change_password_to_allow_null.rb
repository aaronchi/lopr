class ChangePasswordToAllowNull < ActiveRecord::Migration
  def up
    change_column :users, :encrypted_password, :string, :null => true, :default => nil
  end

  def down
  end
end
