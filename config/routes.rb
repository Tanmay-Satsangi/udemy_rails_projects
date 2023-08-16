Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #show is just like a get method
  # index is used for  listing features
  # create is used to insert the entry to the db
  resources :articles, only: [:show, :index, :new, :create]
end