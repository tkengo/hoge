Soleil::Application.routes.draw do
  root 'welcome#index'

  get 'signin' => 'sessions#new', as: :new_signin
  post 'signin' => 'sessions#create'
  get 'home' => 'home#index'
  resources :users, only: [ :new, :create ]

  get '/:identifier/home' => 'projects#show'
  resources :projects, only: [ :new, :create ]
end
