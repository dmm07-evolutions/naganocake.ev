class AddQuestionnareToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :questionnaires_id, :integer
  end
end
