class Survey < ApplicationRecord
  has_many :survey_questions, dependent: :destroy
  has_many :survey_responses
  has_many :users, through: :survey_responses
	after_create :set_code_name

	def set_code_name
		code_name = "DOC" + ("%05d" % id).to_s
        self.update_attribute(:code_name, code_name.upcase)
	end

	def create_survey_details(questions, user, sub_code)
		questions.each do |question|
		  survey_question = SurveyQuestion.new
		  survey_question.question = question
		  survey_question.survey = self
		  survey_question.save
		end
		
		survey_response = SurveyResponse.new
		survey_response.user = user
		survey_response.survey = self
		survey_response.status = false
		survey_response.code_name = self.code_name + "-" + ("%03d" % sub_code).to_s.upcase
		survey_response.save
  end
end
