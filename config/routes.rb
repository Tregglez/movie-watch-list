Rails.application.routes.draw do
  get 'review/new'
  get 'review/create'
  root to: 'lists#index'
  resources :lists, except: [:index] do
    # GET /lists/:list_id/bookmarks/new
    # POST /lists/:list_id/bookmarks
    resources :bookmarks, only: %i[new create index]
    resources :reviews, only: %i[new create]
  end
  resources :bookmarks, only: [:destroy]
end
