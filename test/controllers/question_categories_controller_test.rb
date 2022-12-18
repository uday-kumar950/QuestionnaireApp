require "test_helper"

class QuestionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_category = question_categories(:one)
  end

  test "should get index" do
    get question_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_question_category_url
    assert_response :success
  end

  test "should create question_category" do
    assert_difference("QuestionCategory.count") do
      post question_categories_url, params: { question_category: { active: @question_category.active, name: @question_category.name } }
    end

    assert_redirected_to question_category_url(QuestionCategory.last)
  end

  test "should show question_category" do
    get question_category_url(@question_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_category_url(@question_category)
    assert_response :success
  end

  test "should update question_category" do
    patch question_category_url(@question_category), params: { question_category: { active: @question_category.active, name: @question_category.name } }
    assert_redirected_to question_category_url(@question_category)
  end

  test "should destroy question_category" do
    assert_difference("QuestionCategory.count", -1) do
      delete question_category_url(@question_category)
    end

    assert_redirected_to question_categories_url
  end
end
