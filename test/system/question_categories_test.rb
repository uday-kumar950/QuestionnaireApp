require "application_system_test_case"

class QuestionCategoriesTest < ApplicationSystemTestCase
  setup do
    @question_category = question_categories(:one)
  end

  test "visiting the index" do
    visit question_categories_url
    assert_selector "h1", text: "Question categories"
  end

  test "should create question category" do
    visit question_categories_url
    click_on "New question category"

    check "Active" if @question_category.active
    fill_in "Name", with: @question_category.name
    click_on "Create Question category"

    assert_text "Question category was successfully created"
    click_on "Back"
  end

  test "should update Question category" do
    visit question_category_url(@question_category)
    click_on "Edit this question category", match: :first

    check "Active" if @question_category.active
    fill_in "Name", with: @question_category.name
    click_on "Update Question category"

    assert_text "Question category was successfully updated"
    click_on "Back"
  end

  test "should destroy Question category" do
    visit question_category_url(@question_category)
    click_on "Destroy this question category", match: :first

    assert_text "Question category was successfully destroyed"
  end
end
