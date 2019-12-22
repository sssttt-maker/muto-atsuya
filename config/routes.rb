Rails.application.routes.draw do
  resources :posts, only: %i[index show]
  root to: 'tops#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    get 'home/index'
    resources :posts, only: %i[new create edit update destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
