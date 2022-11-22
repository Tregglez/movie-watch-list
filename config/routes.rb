Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, except: [:index] do
    resources :bookmarks, only: %i[new create index]
  end
  resources :bookmarks, only: [:destroy]
end
