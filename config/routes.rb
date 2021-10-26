Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # A user can add a new bookmark (movie/list pair) to an existing list
  resources :lists, only: %i[index show new create] do # a ver Do we need a MoviesController?
    resources :bookmarks, only: %i[index show new create destroy]
  end
end
