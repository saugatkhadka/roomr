Rails.application.routes.draw do
  # Mounting ActionCable sockets
    # Rails 6 does this by default
    # mount ActionCable.server => '/cable'

  # For all devise user controllers in user folder
  devise_for :users, :paths => 'users'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registration: 'users/registrations',
  # }
  
  resources :users do
    resources :chats, only: [:index, :show, :create] do 
      resources :messages
    end
  end


  root 'chats#index'
end
