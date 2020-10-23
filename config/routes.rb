Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :works do
    collection do
      post :confirm
    end
  end
end
