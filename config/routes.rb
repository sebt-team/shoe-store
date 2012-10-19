Rails.application.routes.draw do

	namespace :api, :defaults => { :format => :json } do
  	resources :shoes
	end

  root 'shoes#index' # shortcut for the above

  resources :shoes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
