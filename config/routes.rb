Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions' # Ensure custom sessions controller is used if needed
  }

  get 'dashboard', to: 'dashboard#index'
 
  resources :projects do
    collection do
      get '/bugs', to: 'bugs#index'
    end
    resources :bugs

  end
 
end
