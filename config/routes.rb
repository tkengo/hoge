Soleil::Application.routes.draw do
  root 'welcome#index'

  get 'signin' => 'sessions#new', as: :new_signin
  post 'signin' => 'sessions#create'
  resources :users, only: [ :new, :create ]
end
