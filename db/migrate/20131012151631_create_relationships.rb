class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :item_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :relationships, :item_id
    add_index :relationships, :followed_id
    add_index :relationships, [:item_id, :followed_id], unique: true
  end
end
