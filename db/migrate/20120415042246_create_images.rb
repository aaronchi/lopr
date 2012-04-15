class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :imageable, :polymorphic => true
      t.string :name
      t.string :image
      t.timestamps
    end
  end
end
