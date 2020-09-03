Rails.application.routes.draw do
  root 'ads#home'

  get 'sign_up'    => 'ads#sign_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
