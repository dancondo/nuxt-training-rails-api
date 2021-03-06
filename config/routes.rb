Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: 'sessions',
                                      registrations: 'registrations' }
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
    namespace :v1 do
      resources :posts do
        get 'home', on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
