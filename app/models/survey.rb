class Survey < ApplicationRecord
  has_many :survey_questions, dependent: :destroy
  has_many :survey_responses
  has_many :users, through: :survey_responses


	after_create :set_code_name

	def set_code_name
		code_name = "DOC" + ("%05d" % id).to_s
        self.update_attribute(:code_name, code_name)
	end
end
