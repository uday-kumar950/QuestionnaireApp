class AddCodeNameToSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_responses, :code_name, :string
  end
end
