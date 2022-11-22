Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, except: [:index] do
    # GET /lists/:list_id/bookmarks/new
    # POST /lists/:list_id/bookmarks
    resources :bookmarks, only: %i[new create index]
  end
  resources :bookmarks, only: [:destroy] do
    resources :reviews, only: %i[new create]
  end
end
