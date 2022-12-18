class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET /surveys or /surveys.json
  def index
    #@surveys = Survey.all

  end

  # GET /surveys/1 or /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    #@survey = Survey.new
    @question_categories = QuestionCategory.joins(:questions).select('name', 'body', 'questions.id').group_by(&:name)
    @users = User.where(admin: false).pluck(:email, :id)
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys or /surveys.json
  def create
    users = User.where(id: params[:user_ids])
    questions = Question.where(id: params[:questions])
    respond_to do |format|
      if users.present? && questions.present?
          survey = Survey.new
        users.each do |user|
          Survey.transaction do
            survey.save
            survey.create_survey_details(questions, user)
          end
        end
        format.html { redirect_to survey_url(survey), notice: "QuestionSet was successfully created." }
        format.json { render :new, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully updated." }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "Survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:code_name)
    end
end
