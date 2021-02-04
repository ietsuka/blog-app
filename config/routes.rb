Rails.application.routes.draw do
  get                '/',    to: 'home#index', as: :root
  resources :signup, only: [:new, :create]
  get            'login',    to: 'sessions#new'
  post           'login',    to: 'sessions#create'
  delete        'logout',    to: 'sessions#delete'
  resources :posts, expect: [:index]
  resources :comments, only: [:show, :create, :update, :destroy]
  namespace :mypage do
    resources :user, only: [:show]
  end
  namespace :setting do 
    resources :user, only: [:show, :update]
  end
  get     'withdraw/:id',    to: 'withdraw#show', as: :show_withdraw
  delete  'withdraw/:id',    to: 'withdraw#delete', as: :delete_withdraw
end
