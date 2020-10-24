Rails.application.routes.draw do
  get 'comments/create'
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'works#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  get "users/show"

  resources :works do
    resources :comments
    collection do
      post :confirm
    end
  end
end
