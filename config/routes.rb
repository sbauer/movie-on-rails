# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  # test route for movies
  get "/movies/:id", to: "movies#show", as: "movie"

end
