class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.belongs_to :attachable, :polymorphic => true, :limit => 20
      t.string  :title
      t.text    :description
      t.string  :type, :limit => 20
      t.string  :file
      t.string  :content_type, :limit => 25
      t.integer :file_size
      t.timestamps
    end
  end
end
