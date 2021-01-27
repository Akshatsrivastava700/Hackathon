Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'votes/create' => 'votes#create', as: 'vote'
  get 'home/destroy' => 'home#destroy', as: 'remove_user'
  get 'votes/destroy' => 'votes#destroy', as: 'remove_vote'
  get 'collaborations/create' => 'collaborations#create', as: 'collaborate'
  get 'collaborations/destroy' => 'collaborations#destroy', as: 'remove_collaboration'
  get 'challenges/show'
  post 'challenges/create'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
