Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/sessions/new', to:'sessions#new', as: "login"
    post '/sessions', to:'sessions#create'
    delete '/sessions', to:'sessions#destroy', as: "logout"

    get '/users/new', to: 'users#new', as: "sign_up"
    post '/users', to: 'users#create'
    get '/users/:id', to: 'users#show', as: "user_profile"

    delete '/photos/:id/delete', to: 'photos#destroy', as: "delete_pic"
    resources :restaurants do
      resources :photos
    end

    root 'photos#index'
end
