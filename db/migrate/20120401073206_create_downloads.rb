class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.belongs_to :downloadable, :polymorphic => true
      t.string :asset
      t.string :content_type
      t.integer :file_size
      t.timestamps
    end
  end
end
