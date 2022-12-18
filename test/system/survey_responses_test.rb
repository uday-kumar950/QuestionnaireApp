require "application_system_test_case"

class SurveyResponsesTest < ApplicationSystemTestCase
  setup do
    @survey_response = survey_responses(:one)
  end

  test "visiting the index" do
    visit survey_responses_url
    assert_selector "h1", text: "Survey responses"
  end

  test "should create survey response" do
    visit survey_responses_url
    click_on "New survey response"

    fill_in "Survey", with: @survey_response.survey_id
    fill_in "User", with: @survey_response.user_id
    click_on "Create Survey response"

    assert_text "Survey response was successfully created"
    click_on "Back"
  end

  test "should update Survey response" do
    visit survey_response_url(@survey_response)
    click_on "Edit this survey response", match: :first

    fill_in "Survey", with: @survey_response.survey_id
    fill_in "User", with: @survey_response.user_id
    click_on "Update Survey response"

    assert_text "Survey response was successfully updated"
    click_on "Back"
  end

  test "should destroy Survey response" do
    visit survey_response_url(@survey_response)
    click_on "Destroy this survey response", match: :first

    assert_text "Survey response was successfully destroyed"
  end
end
