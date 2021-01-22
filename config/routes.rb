Rails.application.routes.draw do
  devise_for :users
  get 'votes/create' => 'votes#create', as: 'vote'
  get 'collaborations/create' => 'collaborations#create', as: 'collaborate'
  get 'challenges/show'
  post 'challenges/create'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
