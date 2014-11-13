Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  get '/post/:id' => 'home#show', as: 'home_post'
  post '/post/:id/comment' => 'home#add_comment', as: 'post_add_comment'

  get '/about_blog' => 'static_pages#about_blog', as: 'static_pages_about_blog'

  namespace :admin do
    get '/' => 'posts#index'

    resources :posts do
      resources :comments, only: [:index, :destroy]

      get 'publish' => 'posts#publish', as: 'publish'
      get 'unpublish' => 'posts#unpublish', as: 'unpublish'
    end
  end

  devise_for :users, skip: [:registrations, :passwords]

end
