class AddStatusToSurveyResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_responses, :status, :boolean
  end
end
