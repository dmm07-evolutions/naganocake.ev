class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genres_id, null:false
      t.string :name, null:false
      t.integer :price, null:false
      t.boolean :status, null:false
      t.text :explanation
      t.string :img_id

      t.timestamps
    end
  end
end
