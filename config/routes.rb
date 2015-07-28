RailsAppTemplate::Application.routes.draw do
  root 'photos#new'
  resources :photos
end
