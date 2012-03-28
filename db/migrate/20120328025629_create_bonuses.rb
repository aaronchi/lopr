class CreateBonuses < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.string :name
      t.text :short_description
      t.string :image
      t.integer :position
      t.timestamps
    end
  end
end
