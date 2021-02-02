Rails.application.routes.draw do
  get                '/',    to: 'home#index', as: :root
  # get          'signup/',    to: 'signup#new'
  # post         'signup/',    to: 'signup#create'
  resources :signup, only: [:new, :create]
  get            'login',    to: 'sessions#new'
  post           'login',    to: 'sessions#create'
  delete        'logout',    to: 'sessions#delete'
  resources :posts, expect: [:index]
  resources :comments, only: [:show, :create, :update, :destroy]
  resources :mypage, only: [:show]
  resources :setting, only: [:show, :update]
  get     'withdraw/:id',    to: 'withdraw#show', as: :show_withdraw
  delete  'withdraw/:id',    to: 'withdraw#delete', as: :delete_withdraw
end
