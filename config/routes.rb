Rails.application.routes.draw do
  root to: 'pages#index'

  get    'board'                        => "pages#board", as: :board

  resources :users, except: :show
  
  resources :lists do
    resources :cards
  end

  get    'signup'                       => "users#new"
  get    'login'                        => "sessions#login", as: :login
  post   'login-attempt'                => "sessions#login_attempt"
  get    'logout'                       => "sessions#logout", as: :logout
end
