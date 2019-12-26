Rails.application.routes.draw do
  resources :posts, only: %i[index show]
  get '/top', to: 'tops#index'
  get '/about', to: 'about#index'
  root to: 'posts#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    get '/', to: 'home#index'
    resources :posts, only: %i[new create edit update destroy] do
      get :all, :published, :drafts, on: :collection
    end
  end
  devise_for :users

end
