class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.boolean :active
      t.references :question_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
