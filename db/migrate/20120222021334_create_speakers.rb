class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.belongs_to :user
      t.string :name
      t.text :short_bio
      t.text :bio
      t.string :avatar
      t.string :slug
      t.integer :position
      t.timestamps
    end
    add_index :speakers, :slug, :unique => true
  end
end
