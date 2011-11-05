Weekee::Application.routes.draw do
  root to: 'pages#index'

  resources :pages, path: 'paginas'
  resources :sessions
  match "/auth/:provider/callback" => "sessions#create"
end
