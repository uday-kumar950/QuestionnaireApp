require "application_system_test_case"

class SurveyQuestionsTest < ApplicationSystemTestCase
  setup do
    @survey_question = survey_questions(:one)
  end

  test "visiting the index" do
    visit survey_questions_url
    assert_selector "h1", text: "Survey questions"
  end

  test "should create survey question" do
    visit survey_questions_url
    click_on "New survey question"

    fill_in "Question", with: @survey_question.question_id
    fill_in "Survey", with: @survey_question.survey_id
    click_on "Create Survey question"

    assert_text "Survey question was successfully created"
    click_on "Back"
  end

  test "should update Survey question" do
    visit survey_question_url(@survey_question)
    click_on "Edit this survey question", match: :first

    fill_in "Question", with: @survey_question.question_id
    fill_in "Survey", with: @survey_question.survey_id
    click_on "Update Survey question"

    assert_text "Survey question was successfully updated"
    click_on "Back"
  end

  test "should destroy Survey question" do
    visit survey_question_url(@survey_question)
    click_on "Destroy this survey question", match: :first

    assert_text "Survey question was successfully destroyed"
  end
end
