class QuestionCategoriesController < ApplicationController
  before_action :set_question_category, only: %i[ show edit update destroy ]

  # GET /question_categories or /question_categories.json
  def index
    @question_categories = QuestionCategory.all
  end

  # GET /question_categories/1 or /question_categories/1.json
  def show
  end

  # GET /question_categories/new
  def new
    @question_category = QuestionCategory.new
  end

  # GET /question_categories/1/edit
  def edit
  end

  # POST /question_categories or /question_categories.json
  def create
    @question_category = QuestionCategory.new(question_category_params)

    respond_to do |format|
      if @question_category.save
        format.html { redirect_to question_categories_url, notice: "Question category was successfully created." }
        format.json { render :show, status: :created, location: @question_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_categories/1 or /question_categories/1.json
  def update
    respond_to do |format|
      if @question_category.update(question_category_params)
        format.html { redirect_to question_category_url(@question_category), notice: "Question category was successfully updated." }
        format.json { render :show, status: :ok, location: @question_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_categories/1 or /question_categories/1.json
  def destroy
    @question_category.destroy

    respond_to do |format|
      format.html { redirect_to question_categories_url, notice: "Question category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_category
      @question_category = QuestionCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_category_params
      params.require(:question_category).permit(:name, :active)
    end
end
