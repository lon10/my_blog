Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  get '/post/:id' => 'home#show', as: 'home_post'
  post '/post/:id/comment' => 'home#add_comment', as: 'post_add_comment'

  get '/about_me' => 'static_pages#about_me', as: 'static_pages_about_me'

  namespace :admin do
    get '/' => 'posts#index'

    resources :posts
  end

  devise_for :users, skip: [:registrations, :passwords]

end
