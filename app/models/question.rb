class Question < ApplicationRecord
  belongs_to :question_category

  validates :body, presence: true
end
