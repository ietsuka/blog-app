Rails.application.routes.draw do
  get                '/',    to: 'home#index', as: :root
  get          'signup/',    to: 'signup#new'
  post         'signup/',    to: 'signup#create'
  get            'login',    to: 'sessions#new'
  post           'login',    to: 'sessions#create'
  delete        'logout',    to: 'sessions#delete'
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :comments, only: [:show, :create, :edit, :destroy]
  resources :mypage, only: [:show]
  resources :setting, only: [:show, :update]
  get     'withdraw/:id',    to: 'withdraw#show', as: :show_withdraw
  delete  'withdraw/:id',    to: 'withdraw#delete', as: :delete_withdraw
end
