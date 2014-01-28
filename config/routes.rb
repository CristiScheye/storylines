Storyline::Application.routes.draw do
  root 'ui#index'
  get 'ui(/:action)', controller: 'ui'

  resources :stories, only: [:new, :create, :show, :index]
  
end
