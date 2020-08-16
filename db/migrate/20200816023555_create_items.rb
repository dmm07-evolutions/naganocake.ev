class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genres_id
      t.string :name
      t.integer :price
      t.boolean :status
      t.text :explanation
      t.string :img_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
