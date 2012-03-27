class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :speaker
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :slug
      t.integer :event_id
      t.integer :ia_id
      t.timestamps
    end
    add_index :events, :slug, :unique => true
  end
end
