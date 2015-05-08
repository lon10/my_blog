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

      get 'enable_comments' => 'posts#enable_comments', as: 'enable_comments'
      get 'disable_comments' => 'posts#disable_comments', as: 'disable_comments'
    end
  end

  devise_for :users, skip: [:registrations, :passwords]

  get '/en/cv' => 'cv#en', as: 'en_cv'
  get '/ru/cv' => 'cv#ru', as: 'ru_cv'
end
