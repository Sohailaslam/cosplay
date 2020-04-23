Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    authenticated :user do
      root :to => 'costumes#index', :as => :authenticated_root
    end

    unauthenticated :user do
      root :to => 'users/sessions#new', :as => :unauthenticated_root
    end
  end

  resources :costumes

  match '/add_images/:id', :to => 'costumes#add_more_images', :via => :get, :as => :add_more_images
  patch '/update_costume_images/:id', :to => 'costumes#update_costume_images', :as => :update_costume_images
end
