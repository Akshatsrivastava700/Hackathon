Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'votes/create' => 'votes#create', as: 'vote'
  get 'home/remove_user' => 'home#remove_user', as: 'remove_user'
  get 'votes/remove_vote' => 'votes#remove_vote', as: 'remove_vote'
  get 'collaborations/create' => 'collaborations#create', as: 'collaborate'
  get 'collaborations/remove_collaboration' => 'collaborations#remove_collaboration', as: 'remove_collaboration'
  get 'challenges/show'
  post 'challenges/create'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
