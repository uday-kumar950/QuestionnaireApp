class AddDeletedAtToQuestionCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :question_categories, :deleted_at, :datetime
    add_index :question_categories, :deleted_at
  end
end
