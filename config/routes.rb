Rails.application.routes.draw do

  root 'shoes#index' # shortcut for the above
  
  # Routes for RestAPI
  namespace :api do
    resources :shoes, except: [:new, :edit], defaults: { format: :json }
  end

  resources :shoes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
