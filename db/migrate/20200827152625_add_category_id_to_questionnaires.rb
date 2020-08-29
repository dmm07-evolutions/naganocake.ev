class AddCategoryIdToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :category_id, :integer
  end
end
