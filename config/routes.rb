Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'works#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :works do
    collection do
      post :confirm
    end
  end
end
