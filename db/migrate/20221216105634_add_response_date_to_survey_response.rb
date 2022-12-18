class AddResponseDateToSurveyResponse < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_responses, :response_date, :date
  end
end
