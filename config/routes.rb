Rails.application.routes.draw do
  root 'pages#todo'

  get '/users/:id/raise_stars', to: 'users#increase_user_stars', as: 'raise_stars'
  resources :users do
    collection do
      get 'count'
    end
  end

end
