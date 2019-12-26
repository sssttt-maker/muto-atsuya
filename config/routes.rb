Rails.application.routes.draw do
  resources :posts, only: %i[index show]
  root to: 'tops#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    get '/home', to: 'home#index'
    resources :posts, only: %i[new create edit update destroy] do
      get :all, :published, :drafts, on: :collection
    end
  end
  devise_for :users

end
