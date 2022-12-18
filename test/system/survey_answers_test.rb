require "application_system_test_case"

class SurveyAnswersTest < ApplicationSystemTestCase
  setup do
    @survey_answer = survey_answers(:one)
  end

  test "visiting the index" do
    visit survey_answers_url
    assert_selector "h1", text: "Survey answers"
  end

  test "should create survey answer" do
    visit survey_answers_url
    click_on "New survey answer"

    fill_in "Answer", with: @survey_answer.answer
    fill_in "Survey question", with: @survey_answer.survey_question_id
    fill_in "Survey response", with: @survey_answer.survey_response_id
    click_on "Create Survey answer"

    assert_text "Survey answer was successfully created"
    click_on "Back"
  end

  test "should update Survey answer" do
    visit survey_answer_url(@survey_answer)
    click_on "Edit this survey answer", match: :first

    fill_in "Answer", with: @survey_answer.answer
    fill_in "Survey question", with: @survey_answer.survey_question_id
    fill_in "Survey response", with: @survey_answer.survey_response_id
    click_on "Update Survey answer"

    assert_text "Survey answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Survey answer" do
    visit survey_answer_url(@survey_answer)
    click_on "Destroy this survey answer", match: :first

    assert_text "Survey answer was successfully destroyed"
  end
end
