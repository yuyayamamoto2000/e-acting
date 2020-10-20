Rails.application.routes.draw do
  resources :works do
    collection do
      post :confirm
    end
  end
end
