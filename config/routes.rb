Rails.application.routes.draw do
  
  get 'comments/new'

  get 'articles/search'

  resources :articles do  
  	resources :comments
  	collection do
  		get :autocomplete
  	end
  end
  root "articles#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
