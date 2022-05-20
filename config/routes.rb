Rails.application.routes.draw do
  resources :job_titles
  resources :magazines
  resources :oenologists
  resources :wine_strains
  resources :strains
  resources :wines
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'wines#index'
end
