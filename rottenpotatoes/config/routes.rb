Rottenpotatoes::Application.routes.draw do
  resources :movies 

  # Set the root path of the app
  root :to => redirect('/movies')
  get 'same_director/:id', to: 'movies#same_director', as: :same_director
end
