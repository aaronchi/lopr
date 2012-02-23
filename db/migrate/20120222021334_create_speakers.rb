class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.belongs_to :user
      t.string :name
      t.text :bio
      t.string :image
      t.string :slug
      t.timestamps
    end
    add_index :speakers, :slug, :unique => true
  end
end
