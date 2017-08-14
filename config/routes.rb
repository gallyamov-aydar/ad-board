Rails.application.routes.draw do
  #devise_for :users
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ads#index'

  get 'users' => 'users#index'

  get '/users/:id', to: 'users#show', as: 'user'

  resources :ads do 
  	resources :comments
  end	
	
  post 'add' => 'comments#create'

end
