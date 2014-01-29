Storyline::Application.routes.draw do
  root 'application#home'
  get 'ui(/:action)', controller: 'ui'

  resources :stories, only: [:new, :create, :show, :index]

end
