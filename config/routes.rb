Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'works#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :users

  resources :conversations do
    resources :messages
  end

  resources :works do
    resources :comments
    collection do
      post :confirm
    end
  end
end
