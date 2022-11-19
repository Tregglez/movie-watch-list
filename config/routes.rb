Rails.application.routes.draw do
  get 'bookmarks/index'
  # List
  root to: 'lists#index'
  resources :lists, except: [:index]

  # Bookmarks
  resources :bookmarks, only: %i[index new create destroy]
end
