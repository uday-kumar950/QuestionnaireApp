class SurveyResponse < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :survey_answers
  has_many :survey_questions, through: :survey_answers

  def create_survey_answers(questions, answers, answers_ids)
    survey_answers_hash = self.survey_answers.group_by(&:id)
    questions.each_with_index do |question, idx|
      survey_answer = survey_answers_hash.present? ? survey_answers_hash[answers_ids[idx].to_i][0] : self.survey_answers.build 
      survey_answer.answer = answers[idx]
      survey_answer.survey_question_id = question
      survey_answer.save
    end
    self.update_attribute(:response_date, Date.today)
  end

  def get_details
    @survey_questions = self.survey.survey_questions
    @survey_questions_hash = @survey_questions.pluck(:question_id, :id).to_h
    survey_answers = self.survey_answers
    @survey_answers_hash = survey_answers.pluck(:survey_question_id, :answer).to_h
    @survey_answers_ids_hash = survey_answers.pluck(:survey_question_id, :id).to_h
    @question_categories = QuestionCategory.joins(:questions).select('name', 'body', 'questions.id').where("questions.id IN (?)", @survey_questions.pluck(:question_id)).group_by(&:name)
    return [@survey_questions_hash, @survey_answers_hash, @survey_answers_ids_hash, @question_categories]
  end
end
