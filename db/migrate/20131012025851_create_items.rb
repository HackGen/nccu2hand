class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :status
      t.integer :price
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    add_index :items, :user_id
  end
end
