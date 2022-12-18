class QuestionCategory < ApplicationRecord
	has_many :questions
	acts_as_paranoid
end
