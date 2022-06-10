Rails.application.routes.draw do
  resources :oenologists
  resources :magazines
  devise_for :users
  resources :wine_strains
  resources :strains
  resources :wines
  resources :magazine_oenologists
  resources :oenologist_wines
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'wines#index'
end
