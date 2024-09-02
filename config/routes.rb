Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'dashboard', to: 'dashboard#index'

  resources :projects do
    # Define search route for projects
    collection do
      get 'search'
    end
    
    # Define bugs route for a project
    resources :bugs do
      # Define search route for bugs within a project
      collection do
        get 'search'
      end
    end
  end
end
