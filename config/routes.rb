Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # A user can add a new bookmark (movie/list pair) to an existing list
  # resources :lists, %i[index show new create] do # a ver Do we need a MoviesController?
  #  resources :bookmarks, only: %i[index new create destroy]
  end

=begin
Tati:
root to: 'lists#index'
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
Mário:
  resources :movies, only: %i[index show] do

    resources :lists do
    resources :bookmarks, except: [:destroy]
  end

  resources :bookmarks, only: [:destroy]
end
Isabela:
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :bookmarks, except: [:destroy]
  end
  resources :bookmarks, only: [:destroy]
end
=end
