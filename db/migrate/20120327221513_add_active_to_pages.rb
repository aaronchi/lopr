class AddActiveToPages < ActiveRecord::Migration
  def change
    add_column :pages, :active, :boolean, :null => false, :default => true

  end
end
