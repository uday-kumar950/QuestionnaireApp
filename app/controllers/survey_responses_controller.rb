class SurveyResponsesController < ApplicationController
  before_action :set_survey_response, only: %i[ show edit update destroy download_pdf send_pdf_document]

  # GET /survey_responses or /survey_responses.json
  def index
    if current_user.admin?
      @survey_responses = SurveyResponse.all
      @users_hash = User.where(id: @survey_responses.pluck(:user_id)).pluck(:id, :email).to_h
    else
      @survey_responses = current_user.survey_responses
    end
  end

  # GET /survey_responses/1 or /survey_responses/1.json
  def show
    @survey_questions_hash, @survey_answers_hash, @survey_answers_ids_hash, @question_categories = @survey_response.get_details
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new
  end

  # GET /survey_responses/1/edit
  def edit
    @survey_questions_hash, @survey_answers_hash, @survey_answers_ids_hash, @question_categories = @survey_response.get_details
  end

  # POST /survey_responses or /survey_responses.json
  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to survey_response_url(@survey_response), notice: "Survey response was successfully created." }
        format.json { render :show, status: :created, location: @survey_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_responses/1 or /survey_responses/1.json
  def update
    respond_to do |format|
      if params[:questions].present? && params[:answers].present? && @survey_response.update(status: true)
        @survey_response.create_survey_answers(params[:questions], params[:answers], params[:answers_ids])
        format.html { redirect_to survey_response_url(@survey_response), notice: "Survey response was successfully updated." }
        format.json { render :show, status: :ok, location: @survey_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_responses/1 or /survey_responses/1.json
  def destroy
    @survey_response.destroy

    respond_to do |format|
      format.html { redirect_to survey_responses_url, notice: "Survey response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_pdf
    #layout 'pdf'
     @survey_questions_hash, @survey_answers_hash, @survey_answers_ids_hash, @question_categories = @survey_response.get_details
     respond_to do |format|
        format.html
        format.pdf do
            render pdf: "Invoice No. ",
            page_size: 'A4',
            layout: "pdf",
            formats: [:html],
            zoom: 1.28,
            dpi: 75
        end
      end
  end

  def send_pdf_document    
     UserMailer.new_survey_email(@survey_response.user).deliver_now
     redirect_to survey_responses_url, notice: "QuestionSet was successfully created."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_response_params
      params.require(:survey_response).permit(:user_id, :survey_id)
    end
end
