Rails.application.routes.draw do
  resources :survey_answers
  resources :survey_questions
  resources :survey_responses do
    member do
      get 'download_pdf', :defaults => { :format => 'pdf' }
    end
  end
  resources :questions
  resources :question_categories
  resources :surveys
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "question_categories#index"
end
