Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'posts#index'

  resources :posts do
    member do
      put :status_new
      put :status_draft
      delete :delete_image
    end

    collection do
      get 'user_posts' => 'posts#user_posts', as: :user_posts
      get 'user_archive' => 'posts#user_archive', as: :user_archive
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
