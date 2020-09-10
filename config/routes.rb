Rails.application.routes.draw do
  
  devise_for :users
  root 'ads#home'

  resources :posts, except: :show do
  	collection do
  	  get 'user_posts' => 'posts#user_posts', as: :user_posts
  	end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
