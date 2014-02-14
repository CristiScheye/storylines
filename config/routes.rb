Storyline::Application.routes.draw do
  devise_for :users
  root 'static#home'
  get 'ui(/:action)', controller: 'ui'
  get 'about' => 'static#about'
  get 'home' => 'static#home'

  resources :stories, only: [:new, :create, :show, :index] do
    resources :entries, only: [:create]
  end

end
