Rails.application.routes.draw do

 root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}

  # get 'sessions/new'
  # get 'users/new'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end

    post :start, on: :member
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
