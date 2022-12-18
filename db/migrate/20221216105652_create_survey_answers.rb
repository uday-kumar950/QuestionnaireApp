class CreateSurveyAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_answers do |t|
      t.text :answer
      t.references :survey_question, null: false, foreign_key: true
      t.references :survey_response, null: false, foreign_key: true

      t.timestamps
    end
  end
end
