Rails.application.routes.draw do
  
  devise_for :customers
   root to: "homes#top"
    resources :search, only: [:new, :index, :show, :create] 
    resources :post
    resources :calculate, only: [:new]
    resources :customer, only: [:show, :edit]
   get "homes/about" => "homes#about", as: "about" 
   get "homes/introduction" => "homes#introduction", as: "introduction" 
   get "homes/completed" => "homes#completed", as: "completed" 
   get "homes/thank" => "homes#thank", as: "thank" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
