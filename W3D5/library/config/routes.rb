Rails.application.routes.draw do

  get 'books', to: 'books#index'
  get 'books/:id', to: 'books#show'
  post 'books', to: 'books#create'
  delete 'books/:id', to: 'books#destroy'


  resources :books, only: [:new, :create, :index, :destroy]
end
