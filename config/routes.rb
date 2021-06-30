Rails.application.routes.draw do
  resources :pets
  resources :users, except: %i[index destroy]  
  resources :ongs do 
    get 'search', on: :collection
  end
  get 'home/index'
  get 'entrar', to:'sessions#new'
  post 'entrar', to:'sessions#create'
  delete 'sair', to:'sessions#destroy'
  root to:"home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
