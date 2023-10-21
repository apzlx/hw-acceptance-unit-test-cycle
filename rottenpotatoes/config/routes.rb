Rottenpotatoes::Application.routes.draw do
  resources :movies do
    get 'same_director', on: :member
  end

  # Set the root path of the app
  root :to => redirect('/movies')
end
