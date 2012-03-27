class AddPositionToSponsorsAndPages < ActiveRecord::Migration
  def change
    add_column :sponsors, :position, :integer
    add_column :pages, :position, :integer
  end
end
