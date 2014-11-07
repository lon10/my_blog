Rails.application.routes.draw do

  root 'home#index'

  get '/post/:id' => 'home#show', as: 'home_post'
  post '/post/:id/comment' => 'home#add_comment', as: 'post_add_comment'

  namespace :admin do
    get '/' => 'posts#index', as: 'admin'

    resources :posts
  end

  devise_for :users, skip: [:registrations, :passwords]

end
