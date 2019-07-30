Rails.application.routes.draw do

  get '/album-search', to: 'albums#search' #search with rspotify
  get '/album-details', to: 'albums#details'
  post '/albums', to: 'albums#create'
  get '/albums', to: 'albums#index' #view saved albums

  resources :collections
  get '/collections-user', to: 'collections#user'
  delete '/collections', to: 'collections#destroy'

  get '/artists', to: 'artists#index' #view saved artists
  get '/artist-search', to: 'artists#search' #search with rspotify

  # get '/auth/spotify/callback', to: 'users#spotify'

  resources :reviews

  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/profile', to: 'auth#profile'

  # get '/spotify-login', to: 'spotifylogin#create'

end
