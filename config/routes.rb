Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
  resources :questions do 
    collection do
      get :question_one
      get :question_two
    end
  end
  resources :employees
end
