Rails.application.routes.draw do
  devise_for :users
  post 'votes/create' => 'votes#create', as: 'vote'
  post 'collaborations/create' => 'collaborations#create', as: 'collaborate'
  get 'challenges/show'
  post 'challenges/create'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
