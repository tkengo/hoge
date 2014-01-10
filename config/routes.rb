Soleil::Application.routes.draw do
  root 'welcome#index'

  resources :users, only: [ :new, :create ]
end
