Rails.application.routes.draw do
  root 'tournaments#index'

  resources :tournaments do
    resources :groups, only: [] do
      collection do
        post :generate
      end
    end
    resources :results, only: [] do
      collection do
        post :generate
      end
    end
  end
end
