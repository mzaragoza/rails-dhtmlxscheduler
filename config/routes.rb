RailsDhtmlxscheduler::Application.routes.draw do
  match 'events/dbaction' => 'events#dbaction', as: :dbaction
  resources :events
  root :to => 'pages#index'
end
