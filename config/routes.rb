Rails.application.routes.draw do
   devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  devise_for :customers
   root to: "homes#top"
    resources :search, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      collection do
        get :map, :mapshow
        post :map
      end
     end  
    resources :post
    resources :calculate
    resources :customer, only: [:index, :create, :show, :edit, :update] do
      collection do
        get :mypage 
      end
     end
   get "homes/about" => "homes#about", as: "about" 
   get "homes/introduction" => "homes#introduction", as: "introduction" 
   get "homes/completed" => "homes#completed", as: "completed" 
   get "homes/thank" => "homes#thank", as: "thank" 
   get "homes/choice" => "homes#choice", as: "choice"
   get '/Core/Skin/Login.aspx', to: 'login#show'
# 　 get 'search/map_request', to: 'search#map', as: 'map_request'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
