class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :survey_responses
  has_many :surveys, through: :survey_responses
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
