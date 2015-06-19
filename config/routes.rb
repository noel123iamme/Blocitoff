Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resources :items, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
