Codium::Application.routes.draw do


  resources :posts do
  	resources :comments
  end

  # Users

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/:id' => 'users#show'
  get 'me/profile' => 'users#profile'


  resources :posts

  get '/me/drafts', to: 'posts#draft_posts'  
  get '/about', to: 'pages#about'

  root :to => 'pages#home'
end
