Rails.application.routes.draw do
  root 'works#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :works do
    collection do
      post :confirm
    end
  end
end
