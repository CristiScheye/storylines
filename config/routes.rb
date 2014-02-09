Storyline::Application.routes.draw do
  root 'application#home'
  get 'ui(/:action)', controller: 'ui'
  get '/about', controller: 'application', action: 'about'

  resources :stories, only: [:new, :create, :show, :index] do
    resources :entries, only: [:create]
  end

end
