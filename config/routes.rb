Rails.application.routes.draw do
  namespace :public do
    get 'items/create'
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get '/new_user', to: 'homes#newuser', as: 'newuser'
    resources :items, only: [:create]
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
  end
end
