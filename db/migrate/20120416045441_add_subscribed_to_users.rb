class AddSubscribedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean, :null => false, :default => false
  end
end
