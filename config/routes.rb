Rails.application.routes.draw do
  
 
  get 'view/index'
  get 'view/show'
  get 'view/edit'
  get 'post/new'
  devise_for :customers
   root to: "homes#top"
    resources :search, only: [:new, :index, :show, :create] 
    resources :post, only: [:new]
   get "homes/about" => "homes#about", as: "about" 
   get "homes/introduction" => "homes#introduction", as: "introduction" 
   get "homes/completed" => "homes#completed", as: "completed" 
   get "homes/thank" => "homes#thank", as: "thank" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
