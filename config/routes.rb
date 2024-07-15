Rails.application.routes.draw do
  root "users#feed"
  
  devise_for :users
  
  resources :comments, except: [:index, :show]
  resources :follow_requests, except: [:index, :show, :new, :edit]
  resources :likes, only: [:create, :destroy]
  resources :photos, except: [:index]
  
  #removes :username to make it more difficult to visit someone elses route
  get "/discover" => "users#discover", as: :discover
  get "/feed" => "users#feed", as: :feed
  get ":username/liked" => "users#liked", as: :liked
  get ":username" => "users#show", as: :user
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
